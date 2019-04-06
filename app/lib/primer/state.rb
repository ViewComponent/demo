module Primer
  class State < ActionView::Component
    def template
      <<-erb
      <div class="State State--green">
        <%= content %>
      </div>
      erb
    end
  end
end
