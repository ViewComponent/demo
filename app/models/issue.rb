class Issue < ApplicationRecord
  belongs_to :pull_request, inverse_of: :issue, optional: true

  def open?
    state == "open"
  end

  def closed?
    state == "closed"
  end
end
