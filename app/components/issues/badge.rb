module Issues
  class Badge < ActionView::Component::Base
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

    validates :state, inclusion: {in: STATES.keys}

    def initialize(state:)
      @state = state
    end

    private

    attr_reader :state
  end
end
