require "rails_helper"

RSpec.describe StringInterp do
  it "renders component with instance method reference" do
    result = render_string("<%= render StringInterp %>")

    assert_includes result.text, "bar"
  end
end
