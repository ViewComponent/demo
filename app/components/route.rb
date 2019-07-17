class Route < ActionView::Component
  def initialize(*)
  end

  def self.template
    <<-erb
    <%= root_path %>
    erb
  end
end
