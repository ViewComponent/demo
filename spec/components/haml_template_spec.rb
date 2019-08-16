require "rails_helper"

RSpec.describe HamlTemplate do
  it "renders component with content" do
    result = render_component(HamlTemplate.new(message: "bar")) { "foo" }

    assert_includes result.text, "foo"
    assert_includes result.text, "bar"
  end
end
