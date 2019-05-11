module ActionView
  class Component < ActionView::Base
    include ActiveModel::Validations
    attr_reader :content

    def self.html(view_context, *args, &block)
      compile unless @compiled
      @compiled = true

      instance = new(*args) { view_context.capture(&block) if block }
      instance.validate!
      instance.html
    end

    def initialize(*args)
      @content = yield
      super(*args)
    end

    private_class_method def self.compile
      class_eval(
        "def html; @output_buffer = ActionView::OutputBuffer.new; " +
        ActionView::Template::Handlers::ERB.erb_implementation.new(template, trim: true).src +
        "; end"
      )
    end
  end
end
