require "test_helper"

class Issues::BadgeComponentTest < ViewComponent::TestCase
  def test_closed_state
    render_inline(Issues::BadgeComponent.new(state: :closed))

    assert_text("Closed")
    assert_selector("[title='Status: Closed']")
    assert_selector(".State--red")
    assert_selector(".octicon-issue-closed")
  end

  def test_open_state
    render_inline(Issues::BadgeComponent.new(state: :open))

    assert_text("Open")
    assert_selector("[title='Status: Open']")
    assert_selector(".State--green")
    assert_selector(".octicon-issue-opened")
  end
end