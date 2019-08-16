class Box < ActionView::Component
  validates :content, presence: true

  def self.template
    <<-erb
    <div class="Box p-2"><%= content %></div>
    erb
  end
end
