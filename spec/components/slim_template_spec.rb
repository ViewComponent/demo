require "rails_helper"

RSpec.describe SlimTemplate do
  it "renders component with content" do
    result = render_component(SlimTemplate.new(message: "bar")) { "foo" }

    assert_includes result.text, "foo"
    assert_includes result.text, "bar"
  end
end
