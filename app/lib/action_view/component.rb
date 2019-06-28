# frozen_string_literal: true

module ActionView
  class Component < ActionView::Base
    include ActiveModel::Validations

    # Entrypoint for rendering. Called by ActionView::RenderingHelper#render.
    #
    # view_context: ActionView context from calling view
    # args(hash): params to be passed to component being rendered
    # block: optional block to be called within the view context
    #
    # returns HTML that has been escaped with the ERB pipeline
    #
    # Example subclass:
    #
    # app/components/my_component.rb:
    # class MyComponent < ActionView::Component
    #   def initialize(title:)
    #     @title = title
    #   end
    # end
    #
    # app/components/my_component.html.erb
    # <span title="<%= @title %>">Hello, <%= content %>!</span>
    #
    # In use:
    # <%= render MyComponent.new(title: "greeting") do %>world<% end %>
    # returns:
    # <span title="greeting">Hello, world!</span>

    # @see https://github.com/devnacho/mountain_view/blob/master/lib/mountain_view/presenter.rb#L65
    module ViewContext
      attr_reader :_component

      def inject_component_context(component)
        @_component = component

        protected_methods = ActionView::Component.public_methods(false)
        methods = component.public_methods(false) - protected_methods

        methods.each do |meth|
          next if self.class.method_defined?(meth)
          next unless _component.respond_to?(meth)

          self.class.delegate meth, to: :_component
        end
      end
    end

    def render_in(context, *_args)
      context.extend ViewContext
      context.inject_component_context self

      @content = yield if block_given?

      validate!

      if self.class.template
        renderer = ActionView::TemplateRenderer.new(context.lookup_context)
        renderer.render(context, inline: self.class.template).body
      else
        context.render(template: self.class.filename)
      end
    end

    def initialize(*); end

    def self.template; end

    def self.filename
      name = instance_method(:initialize).source_location[0]

      raise NotImplementedError, 'Subclasses of ActionView::Component must implement #initialize' if name == __FILE__

      filename_without_extension = name[0..-(File.extname(name).length + 1)]
      filename_without_extension.sub(Rails.root.join('app', 'components').to_s, '').sub(%r{\A/}, '')
    end

    private

    attr_reader :content
  end
end
