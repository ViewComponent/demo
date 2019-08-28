class Box < ActionView::Component::Base
  validates :content, presence: true

  def initialize(*)
  end
end
