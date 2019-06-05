module ActionView
  class Component < ActionView::Base
    include ActiveModel::Validations

    # Entrypoint for rendering. Called by ActionView::RenderingHelper#render.
    #
    # Returns ActionView::OutputBuffer.
    def render_object(view_context, &block)
      self.class.compile
      @content = view_context.capture(&block) if block_given?
      validate!
      rendered_template
    end

    def self.compile
      @compiled ||= nil
      return if @compiled

      class_eval(
        "def rendered_template; @output_buffer = ActionView::OutputBuffer.new; " +
        ActionView::Template::Handlers::ERB.erb_implementation.new(template, trim: true).src +
        "; end"
      )

      @compiled = true
    end

  private

    attr_reader :content
  end
end
