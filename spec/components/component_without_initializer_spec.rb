require "rails_helper"

RSpec.describe ComponentWithoutInitializer do
  it "responds with a friendly message if there is no initializer" do
    error = assert_raises NotImplementedError do
      render_inline(ComponentWithoutInitializer)
    end

    assert_includes error.message, "ComponentWithoutInitializer must implement #initialize."
  end
end
