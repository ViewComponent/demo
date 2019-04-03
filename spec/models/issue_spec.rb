require "rails_helper"

describe Issue do
  describe "state" do
    it "returns open when the issue is open" do
      issue = create(:issue, :open)

      assert_equal "open", issue.state
    end

    it "returns closed when the issue is closed" do
      issue = create(:issue, :closed)

      assert_equal "closed", issue.state
    end
  end

  describe "closed?" do
    it "returns true when the issue is closed" do
      assert create(:issue, :closed).closed?
    end

    it "returns false when the issue is open" do
      refute create(:issue, :open).closed?
    end
  end

  describe "open?" do
    it "returns false when the issue is closed" do
      refute create(:issue, :closed).open?
    end

    it "returns true when the issue is open" do
      assert create(:issue, :open).open?
    end
  end
end
