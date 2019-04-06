module Issues
  class Badge < ActionView::Component
    include OcticonsHelper

    def initialize(issue:)
      @issue = issue
    end

    def template
      <<-erb
      <% if @issue.closed? %>
        <div class="State State--red">
          <%= octicon('issue-closed') %> Closed
        </div>
      <% else %>
        <%= render Issues::Badge, color: :green do %>
          <%= octicon('issue-opened') %> Open
        <% end %>
      <% end %>
      erb
    end
  end
end
