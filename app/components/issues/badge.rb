module Issues
  class Badge
    include OcticonsHelper

    def render
      eval(
        "output_buffer = ActionView::OutputBuffer.new; " +
        ActionView::Template::Handlers::ERB.erb_implementation.new(template, trim: true).src
      )
    end

    def template
      <<-erb
      <div class="State State--green">
        #{octicon('issue-opened')} Open
      </div>
      erb
    end
  end
end
