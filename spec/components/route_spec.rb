require "rails_helper"

RSpec.describe Route do
  it "renders component with url helper" do
    result = render_component(Route.new)

    assert_includes result.text, "/"
  end
end
