require "rails_helper"

RSpec.describe ComponentWithoutTemplate do
  it "responds with a friendly message if there is no template" do
    error = assert_raises NotImplementedError do
      render_component(ComponentWithoutTemplate.new)
    end

    assert_includes error.message, "Could not find a template for ComponentWithoutTemplate."
  end
end
