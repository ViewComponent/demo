require "test_helper"

class SlimComponentTest < ViewComponent::TestCase
  def test_inline_template
    render_inline(SlimComponent.new)

    assert_text("Hi!")
  end
end