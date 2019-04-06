module Primer
  class State < ActionView::Component
    COLOR_CLASS_MAPPINGS = {
      default: "",
      green: "State--green",
      red: "State--red",
      purple: "State--purple",
    }.freeze

    attr_reader :color
    validates :color, inclusion: { in: COLOR_CLASS_MAPPINGS.keys }

    def initialize(color:)
      @color = color
    end

    def template
      <<-erb
      <div class="State State--green">
        <%= content %>
      </div>
      erb
    end
  end
end
