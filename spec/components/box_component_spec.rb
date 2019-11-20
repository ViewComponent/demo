require "rails_helper"

RSpec.describe BoxComponent do
  it "renders component with inline template" do
    result = render_inline(BoxComponent) { "foo" }

    assert result.css(".Box").any?
  end
end
