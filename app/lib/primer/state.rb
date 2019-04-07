module Primer
  class State < ActionView::Component
    COLOR_CLASS_MAPPINGS = {
      default: "",
      green: "State--green",
      red: "State--red",
      purple: "State--purple",
    }.freeze

    attr_reader :color, :title
    validates :color, inclusion: {in: COLOR_CLASS_MAPPINGS.keys}
    validates :title, presence: true

    def initialize(color: :default, title:)
      @color, @title = color, title
    end

    def self.template
      <<-erb
      <div title="<%= title %>" class="State <%= class_name %>">
        <%= content %>
      </div>
      erb
    end

    def class_name
      COLOR_CLASS_MAPPINGS[color]
    end
  end
end
