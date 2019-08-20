class Box < ActionView::Component
  validates :content, presence: true

  def initialize(*)
  end
end
