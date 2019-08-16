require "rails_helper"

RSpec.describe ErbTemplate do
  it "renders component with content" do
    result = render_component(ErbTemplate.new(message: "bar")) { "foo" }

    assert_includes result.text, "foo"
    assert_includes result.text, "bar"
  end
end
