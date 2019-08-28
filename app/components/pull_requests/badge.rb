module PullRequests
  class Badge < ActionView::Component::Base
    include OcticonsHelper

    validates :state, inclusion: {in: [:merged, :closed, :open]}
    validates :is_draft, inclusion: {in: [true, false]}

    def initialize(state:, is_draft:)
      @state, @is_draft = state, is_draft
    end

    private

    attr_reader :state, :is_draft

    def label
      if state == :open && is_draft
        "Draft"
      else
        state.to_s.capitalize
      end
    end

    def color
      case state
      when :closed
        :red
      when :merged
        :purple
      when :open
        if is_draft
          :default
        else
          :green
        end
      end
    end

    def octicon_name
      case state
      when :merged
        "git-merge"
      when :closed, :open
        "git-pull-request"
      end
    end
  end
end
