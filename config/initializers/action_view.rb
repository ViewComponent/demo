class ActionView::Base
  module RenderMonkeyPatch
    def render(component, *args, &block)
      return super unless component.is_a?(Class) && component < ActionView::Component

      component.html(self, *args, &block)
    end
  end

  prepend RenderMonkeyPatch
end
