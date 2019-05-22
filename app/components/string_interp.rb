class StringInterp < ActionView::Component
  def self.template
    <<-'erb'
    <div><%= "#{foo}" %></div>
    erb
  end

  def foo
    "bar"
  end
end
