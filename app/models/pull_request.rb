class PullRequest < ApplicationRecord
  has_one :issue, inverse_of: :pull_request

  def state
    return :open     if open?
    return :merged   if merged?
    return :closed   if closed?
  end

  def open?
    issue.nil? || issue.open?
  end

  def closed?
    !open?
  end

  def merged?
    !merged_at.nil?
  end
end
