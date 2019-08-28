require "rails_helper"

RSpec.describe Box do
  it "renders component with inline template" do
    result = render_inline(Box) { "foo" }

    assert result.css(".Box").any?
  end
end
