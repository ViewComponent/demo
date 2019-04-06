module ActionView
  class Component < ActionView::Base
    include ActiveModel::Validations
    attr_accessor :content

    def html
      eval(
        "output_buffer = ActionView::OutputBuffer.new; " +
        ActionView::Template::Handlers::ERB.erb_implementation.new(template, trim: true).src
      )
    end
  end
end
