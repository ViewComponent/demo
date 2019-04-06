class ActionView::Base
  module RenderMonkeyPatch
    def render(component, *args)
      return super unless component == Issues::Badge

      component.new(*args).render
    end
  end

  prepend RenderMonkeyPatch
end
