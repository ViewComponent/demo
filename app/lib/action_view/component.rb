# Use this monkey patch if you aren't running Rails master / 6.1 alpha
#
# class ActionView::Base
#   module RenderMonkeyPatch
#     def render(component, _ = nil, &block)
#       return super unless component.respond_to?(:render_in)
#
#       component.render_in(self, &block)
#     end
#   end
#
#   prepend RenderMonkeyPatch
# end

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
    #
    def render_in(view_context, *args, &block)
      self.class.compile
      @content = view_context.capture(&block) if block_given?
      validate!
      call
    end

    def initialize(*); end

    def self.inherited(child)
      child.include Rails.application.routes.url_helpers unless child < Rails.application.routes.url_helpers

      super
    end

    def self.compile
      @compiled ||= nil
      return if @compiled

      class_eval(
        "def call; @output_buffer = ActionView::OutputBuffer.new; " +
        ActionView::Template.handler_for_extension(template_handler).call(DummyTemplate.new, template) +
        "; end"
      )

      @compiled = true
    end

    def self.template_handler
      # Does the subclass implement .template ? If so, we assume the template is an ERB HEREDOC
      if self.method(:template).owner == self.singleton_class
        :erb
      else
        File.extname(template_file_path).gsub(".", "").to_sym
      end
    end

    class DummyTemplate
      def identifier
        ""
      end

      # we'll eventually want to update this to support other types
      def type
        "text/html"
      end
    end

    def self.template_file_path
      filename = self.instance_method(:initialize).source_location[0]

      raise NotImplementedError.new("Subclasses of ActionView::Component must implement #initialize") if filename == __FILE__

      filename_without_extension = filename[0..-(File.extname(filename).length + 1)]
      siblings_files = Dir["#{filename_without_extension}.*"] - [filename]

      raise StandardError.new("too many sidecars") if siblings_files.length > 1

      if siblings_files.length == 0
        raise NotImplementedError.new(
          "Could not find a template for #{self}. Either define a .template method or add a sidecar template file."
        )
      end

      siblings_files[0]
    end

    def self.template
      File.read(template_file_path)
    end

    private

    attr_reader :content
  end
end
