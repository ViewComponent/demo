class BoxComponent < ActionView::Component::Base
  validates :content, presence: true

  def initialize(*)
  end
end
