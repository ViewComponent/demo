module Issues
  class Badge < ActionView::Component
    include OcticonsHelper

    STATES = {
      open: {
        color: :green,
        octicon_name: "issue-opened",
        label: "Open",
      },
      closed: {
        color: :red,
        octicon_name: "issue-closed",
        label: "Closed",
      },
    }.freeze

    attr_reader :state
    validates :state, inclusion: {in: STATES.keys}

    def initialize(state:)
      @state = state
    end

    def self.template
      <<-'erb'
      <%= render Primer::State, color: STATES[state][:color], title: "Status: #{state.to_s.titleize}" do %>
        <%= octicon(STATES[state][:octicon_name]) %> <%= STATES[state][:label] %>
      <% end %>
      erb
    end
  end
end
