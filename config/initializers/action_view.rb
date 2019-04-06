class ActionView::Base
  module RenderMonkeyPatch
    def render(component, *args, &block)
      return super unless component == Issues::Badge

      component.new.render
    end
  end

  prepend RenderMonkeyPatch
end
