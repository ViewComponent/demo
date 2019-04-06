module PullRequests
  class Badge < ActionView::Component
    include OcticonsHelper

    def initialize(pull_request:)
      @pull_request = pull_request
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
      <% else %>
        <div class="State State--green">
          <%= octicon('git-pull-request') %> Open
        </div>
      <% end %>
      erb
    end
  end
end
