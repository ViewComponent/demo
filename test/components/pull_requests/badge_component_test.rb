require "test_helper"

class PullRequests::BadgeComponentTest < ViewComponent::TestCase
  def test_closed_draft_state
    render_inline(PullRequests::BadgeComponent.new(state: :closed, is_draft: true))

    assert_text("Closed")
    assert_selector("[title='Status: Closed']")
    assert_selector(".State--red")
    assert_selector(".octicon-git-pull-request")
  end

  def test_closed_state
    render_inline(PullRequests::BadgeComponent.new(state: :closed, is_draft: false))

    assert_text("Closed")
    assert_selector("[title='Status: Closed']")
    assert_selector(".State--red")
    assert_selector(".octicon-git-pull-request")
  end

  def test_merged_state
    render_inline(PullRequests::BadgeComponent.new(state: :merged, is_draft: false))

    assert_text("Merged")
    assert_selector("[title='Status: Merged']")
    assert_selector(".State--purple")
    assert_selector(".octicon-git-merge")
  end

  def test_open_state
    render_inline(PullRequests::BadgeComponent.new(state: :open, is_draft: false))

    assert_text("Open")
    assert_selector("[title='Status: Open']")
    assert_selector(".State--green")
    assert_selector(".octicon-git-pull-request")
  end

  def test_draft_state
    render_inline(PullRequests::BadgeComponent.new(state: :open, is_draft: true))

    assert_text("Draft")
    assert_selector("[title='Status: Draft']")
    assert_selector(".octicon-git-pull-request")
  end
end