require "rails_helper"

RSpec.describe Box do
  it "renders component with inline template" do
    result = render_component(Box.new) { "foo" }

    assert result.css(".Box").any?
  end
end
