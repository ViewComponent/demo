require "rails_helper"

RSpec.describe ComponentWithTooManySidecarFiles do
  it "responds with a friendly message if there is no template" do
    error = assert_raises StandardError do
      render_inline(ComponentWithTooManySidecarFiles)
    end

    assert_includes error.message, "More than one template found for ComponentWithTooManySidecarFiles."
  end
end
