module Primer
  class State < ActionView::Component
    attr_accessor :content

    def template
      <<-erb
      <div class="State State--green">
        <%= content %>
      </div>
      erb
    end
  end
end
