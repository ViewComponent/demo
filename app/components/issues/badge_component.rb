module Issues
  class BadgeComponent < ViewComponent::Base
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

    def initialize(state:)
      @state = state
    end

    private

    attr_reader :state
  end
end
