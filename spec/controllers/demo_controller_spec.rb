require "rails_helper"

RSpec.describe DemoController, type: :controller do
  render_views

  it "renders the open issue badge" do
    create(:issue, :open)

    get :index

    assert_select(".State.State--green")
    assert_select(".octicon-issue-opened")
    assert_includes(response.body, "Open")
  end

  it "renders the closed issue badge" do
    create(:issue, :closed)

    get :index

    assert_select(".State.State--red")
    assert_select(".octicon-issue-closed")
    assert_includes(response.body, "Closed")
  end

  it "renders the open pull request badge" do
    create(:issue, :open, :with_pull_request)

    get :index

    assert_select(".State.State--green")
    assert_select(".octicon-git-pull-request")
    assert_includes(response.body, "Open")
  end

  it "renders the closed pull request badge" do
    create(:issue, :closed, :with_pull_request)

    get :index

    assert_select(".State.State--red")
    assert_select(".octicon-git-pull-request")
    assert_includes(response.body, "Closed")
  end

  it "renders the merged pull request badge" do
    create(:issue, :closed, pull_request: create(:pull_request, :merged))

    get :index

    assert_select(".State.State--purple")
    assert_select(".octicon-git-merge")
    assert_includes(response.body, "Merged")
  end

  it "renders the draft pull request badge" do
    create(:issue, :open, pull_request: create(:pull_request, :draft))

    get :index

    assert_select(".State")
    assert_select(".octicon-git-pull-request")
    assert_includes(response.body, "Draft")
  end

  it "renders the closed pull request badge for a closed draft pull request" do
    create(:issue, :closed, pull_request: create(:pull_request, :draft))

    get :index

    assert_select(".State.State--red")
    assert_select(".octicon-git-pull-request")
    assert_includes(response.body, "Closed")
  end
end
