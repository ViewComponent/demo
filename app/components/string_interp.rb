class StringInterp < ActionView::Component
  def self.template
    <<-'erb'
    <div><%= "#{foo}" %></div>
    erb
  end

  private

  def foo
    "bar"
  end
end
