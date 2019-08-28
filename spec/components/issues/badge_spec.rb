require "rails_helper"

RSpec.describe Issues::Badge do
  it "renders the closed state" do
    result = render_inline(Issues::Badge, state: :closed)

    assert_includes result.text, "Closed"
    assert result.css("[title='Status: Closed']").any?
    assert result.css(".State--red").any?
    assert result.css(".octicon-issue-closed").any?
  end

  it "renders the open state" do
    result = render_inline(Issues::Badge, state: :open)

    assert_includes result.text, "Open"
    assert result.css("[title='Status: Open']").any?
    assert result.css(".State--green").any?
    assert result.css(".octicon-issue-opened").any?
  end
end
