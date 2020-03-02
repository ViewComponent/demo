# frozen_string_literal: true

module PullRequests
  class BadgeComponentPreview < ViewComponent::Preview
    def open
      render(PullRequests::BadgeComponent.new(state: :open, is_draft: false))
    end

    def draft
      render(PullRequests::BadgeComponent.new(state: :open, is_draft: true))
    end

    def closed
      render(PullRequests::BadgeComponent.new(state: :closed, is_draft: false))
    end

    def merged
      render(PullRequests::BadgeComponent.new(state: :merged, is_draft: false))
    end
  end
end
