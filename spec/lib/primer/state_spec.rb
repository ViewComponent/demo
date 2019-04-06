require "rails_helper"

RSpec.describe Primer::State do
  it "renders content passed to it as a block" do
    result = render_string("<%= render Primer::State, color: :green do %>content<% end %>")

    assert_includes result.css(".State.State--green").text, "content"
  end

  it "raises an error when color is not one of valid values" do
    exception = assert_raises ActionView::Template::Error do
      render_string("<%= render Primer::State, color: :chartreuse do %>foo<% end %>")
    end

    assert_includes exception.message, "Color is not included in the list"
  end

  it "assigns the correct CSS class for color" do
    result = render_string("<%= render Primer::State, color: :purple do %>content<% end %>")

    assert result.css(".State.State--purple").any?
  end
end
