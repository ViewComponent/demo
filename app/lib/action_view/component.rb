module ActionView
  class Component
    attr_accessor :content
    
    def render
      eval(
        "output_buffer = ActionView::OutputBuffer.new; " +
        ActionView::Template::Handlers::ERB.erb_implementation.new(template, trim: true).src
      )
    end
  end
end
