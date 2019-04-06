module Issues
  class Badge
    include OcticonsHelper

    def initialize(issue:, pull_request: nil)
      @issue, @pull_request = issue, pull_request
    end

    def render
      eval(
        "output_buffer = ActionView::OutputBuffer.new; " +
        ActionView::Template::Handlers::ERB.erb_implementation.new(template, trim: true).src
      )
    end

    def template
      <<-erb
      <% if @pull_request && @pull_request.merged? %>
        <div class="State State--purple">
          <%= octicon('git-merge') %> Merged
        </div>
      <% elsif @pull_request && @pull_request.closed? %>
        <div class="State State--red">
          <%= octicon('git-pull-request') %> Closed
        </div>
      <% elsif @pull_request && @pull_request.draft? %>
        <div class="State">
        <%= octicon('git-pull-request') %> Draft
        </div>
      <% elsif @pull_request %>
        <div class="State State--green">
          <%= octicon('git-pull-request') %> Open
        </div>
      <% elsif @issue.closed? %>
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
