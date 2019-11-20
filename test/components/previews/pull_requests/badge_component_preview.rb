# frozen_string_literal: true

module PullRequests
  class BadgeComponentPreview < ActionView::Component::Preview
    def open
      render(PullRequests::BadgeComponent, state: :open, is_draft: false)
    end

    def draft
      render(PullRequests::BadgeComponent, state: :open, is_draft: true)
    end

    def closed
      render(PullRequests::BadgeComponent, state: :closed, is_draft: false)
    end

    def merged
      render(PullRequests::BadgeComponent, state: :merged, is_draft: false)
    end
  end
end
