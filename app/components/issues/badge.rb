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
  end
end
