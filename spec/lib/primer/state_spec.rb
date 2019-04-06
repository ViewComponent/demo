require "rails_helper"

RSpec.describe Primer::State do
  it "renders content passed to it as a block" do
    result = render_string("<%= render Primer::State do %>content<% end %>")

    assert_includes result.css(".State.State--green").text, "content"
  end
end
