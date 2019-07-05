# Use this monkey patch if you aren't running Rails master / 6.1 alpha
#
# module ViewComponentRenderer
#   def render(component, _ = nil, &block)
#     return super unless component.respond_to?(:render_in)
#
#     component.render_in(self, &block)
#   end
# end
#
# module ControllerComponentRenderer
#   def render(context, options, &block)
#     return super unless options[:partial].respond_to?(:render_in)
#
#     options[:partial].render_in(self, &block)
#   end
# end
#
# # Used when calling `render` in templates and partials
# ActionView::Base.prepend(ViewComponentRenderer)
# # Used when calling `render` in controller actions
# ActionView::Renderer.prepend(ControllerComponentRenderer)

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

    def self.compile
      @compiled ||= nil
      return if @compiled

      class_eval(
        "def call; @output_buffer = ActionView::OutputBuffer.new; " +
        ActionView::Template::Handlers::ERB.erb_implementation.new(template, trim: true).src +
        "; end"
      )

      @compiled = true
    end

    def self.template
      filename = self.instance_method(:initialize).source_location[0]

      raise NotImplementedError.new("Subclasses of ActionView::Component must implement #initialize") if filename == __FILE__

      filename_without_extension = filename[0..-(File.extname(filename).length + 1)]

      erb_template_path = filename_without_extension+".html.erb"

      if File.file?(erb_template_path)
        File.read(erb_template_path)
      else
        raise NotImplementedError.new("Could not find template, expected #{erb_template_path} to define it")
      end
    end

    private

    attr_reader :content
  end
end
