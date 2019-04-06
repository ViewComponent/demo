module PullRequests
  class Badge < ActionView::Component
    include OcticonsHelper

    def initialize(pull_request:)
      @pull_request = pull_request
    end

    def template
      <<-erb
      <% if @pull_request && @pull_request.merged? %>
        <%= render Primer::State, color: :purple, title: "Status: Merged" do %>
          <%= octicon('git-merge') %> Merged
        <% end %>
      <% elsif @pull_request && @pull_request.closed? %>
        <%= render Primer::State, color: :red, title: "Status: Closed" do %>
          <%= octicon('git-pull-request') %> Closed
        <% end %>
      <% elsif @pull_request && @pull_request.draft? %>
        <%= render Primer::State, color: :default, title: "Status: Draft" do %>
          <%= octicon('git-pull-request') %> Draft
        <% end %>
      <% else %>
        <%= render Primer::State, color: :green, title: "Status: Open" do %>
          <%= octicon('git-pull-request') %> Open
        <% end %>
      <% end %>
      erb
    end
  end
end
