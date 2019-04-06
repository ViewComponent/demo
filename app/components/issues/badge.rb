module Issues
  class Badge < ActionView::Component
    include OcticonsHelper

    STATES = {
      open: {
        color: :green,
        octicon_name: "issue-opened",
        label: "Open"
      },
      closed: {
        color: :red,
        octicon_name: "issue-closed",
        label: "Closed"
      }
    }.freeze

    attr_reader :state
    validates :state, inclusion: { in: STATES.keys }

    def initialize(state:)
      @state = state
    end

    def template
      <<-erb
      <%= render Primer::State, color: color, title: "Status: Closed" do %>
        <%= octicon(octicon_name) %> <%= label %>
      <% end %>
      erb
    end

    def color
      STATES[state][:color]
    end

    def octicon_name
      STATES[state][:octicon_name]
    end

    def label
      STATES[state][:label]
    end
  end
end
