require "rails_helper"

describe PullRequest do
  describe "state" do
    it "returns open when the PullRequest's issue is open" do
      pull_request = create(:issue, :open, :with_pull_request).pull_request

      assert_equal :open, pull_request.state
    end

    it "returns open when the PullRequest doesn't have an issue" do
      assert_equal :open, create(:pull_request).state
    end

    it "returns closed when the PullRequest's issue is closed" do
      pull_request = create(:issue, :closed, :with_pull_request).pull_request

      assert_equal :closed, pull_request.state
    end

    it "returns merged when the PullRequest has been merged" do
      pull_request = create(:issue, :closed, pull_request: create(:pull_request, :merged)).pull_request

      assert_equal :merged, pull_request.state
    end
  end

  describe "closed?" do
    it "returns true when the issue is closed" do
      assert create(:issue, :closed, :with_pull_request).pull_request.closed?
    end

    it "returns false when the issue is open" do
      refute create(:issue, :open, :with_pull_request).pull_request.closed?
    end
  end

  describe "open?" do
    it "returns false when the issue is closed" do
      refute create(:issue, :closed, :with_pull_request).pull_request.open?
    end

    it "returns true when the issue is open" do
      assert create(:issue, :open, :with_pull_request).pull_request.open?
    end

    it "returns true when the PullRequest doesn't have an issue" do
      assert create(:pull_request).open?
    end
  end

  describe "merged?" do
    it "returns true when the pull request has been merged" do
      assert create(:pull_request, :merged).merged?
    end

    it "returns false when the pull request has not been merged" do
      refute create(:pull_request).merged?
    end
  end
end
