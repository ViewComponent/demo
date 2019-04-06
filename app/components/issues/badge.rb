module Issues
  class Badge < ActionView::Component
    include OcticonsHelper

    def initialize(issue:)
      @issue = issue
    end

    def render
      eval(
        "output_buffer = ActionView::OutputBuffer.new; " +
        ActionView::Template::Handlers::ERB.erb_implementation.new(template, trim: true).src
      )
    end

    def template
      <<-erb
      <% if @issue.closed? %>
        <div class="State State--red">
          <%= octicon('issue-closed') %> Closed
        </div>
      <% else %>
        <div class="State State--green">
          <%= octicon('issue-opened') %> Open
        </div>
      <% end %>
      erb
    end
  end
end
