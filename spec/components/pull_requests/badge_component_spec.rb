require "rails_helper"

RSpec.describe PullRequests::BadgeComponent do
  it "renders the merged state" do
    result = render_inline(PullRequests::BadgeComponent, state: :merged, is_draft: false)

    assert_includes result.text, "Merged"
    assert result.css("[title='Status: Merged']").any?
    assert result.css(".State--purple").any?
    assert result.css(".octicon-git-merge").any?
  end

  it "renders the closed state" do
    result = render_inline(PullRequests::BadgeComponent, state: :closed, is_draft: false)

    assert_includes result.text, "Closed"
    assert result.css("[title='Status: Closed']").any?
    assert result.css(".State--red").any?
    assert result.css(".octicon-git-pull-request").any?
  end

  it "renders the closed draft state" do
    result = render_inline(PullRequests::BadgeComponent, state: :closed, is_draft: true)

    assert_includes result.text, "Closed"
    assert result.css("[title='Status: Closed']").any?
    assert result.css(".State--red").any?
    assert result.css(".octicon-git-pull-request").any?
  end

  it "renders the open state" do
    result = render_inline(PullRequests::BadgeComponent, state: :open, is_draft: false)

    assert_includes result.text, "Open"
    assert result.css("[title='Status: Open']").any?
    assert result.css(".State--green").any?
    assert result.css(".octicon-git-pull-request").any?
  end

  it "renders the draft state" do
    result = render_inline(PullRequests::BadgeComponent, state: :open, is_draft: true)

    assert_includes result.text, "Draft"
    assert result.css("[title='Status: Draft']").any?
    assert result.css(".octicon-git-pull-request").any?
  end
end
