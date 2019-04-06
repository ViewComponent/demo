class ActionView::Base
  module RenderMonkeyPatch
    def render(component, *args, &block)
      return super unless component.is_a?(Class) && component < ActionView::Component

      instance = component.new(*args)
      instance.content = self.capture(&block) if block_given?
      instance.validate!
      instance.render
    end
  end

  prepend RenderMonkeyPatch
end
