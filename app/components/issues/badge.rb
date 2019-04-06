module Issues
  class Badge < ActionView::Component
    include OcticonsHelper

    def initialize(issue:)
      @issue = issue
    end

    def template
      <<-erb
      <% if @issue.closed? %>
        <%= render Primer::State, color: :red, title: "Status: Closed" do %>
          <%= octicon('issue-closed') %> Closed
        <% end %>
      <% else %>
        <%= render Primer::State, color: :green, title: "Status: Open" do %>
          <%= octicon('issue-opened') %> Open
        <% end %>
      <% end %>
      erb
    end
  end
end
