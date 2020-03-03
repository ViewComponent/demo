require "test_helper"

class BoxComponentTest < ViewComponent::TestCase
  def test_inline_template
    render_inline(BoxComponent.new) { "foo" }

    assert_selector(".Box")
  end
end