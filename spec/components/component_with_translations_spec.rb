require "rails_helper"

RSpec.describe ComponentWithTranslations do
  it "renders component with title from translations" do
    result = render_inline(ComponentWithTranslations)

    assert_includes result.text, I18n.t('components.component_with_translations.title')
    assert_includes result.text, I18n.t('components.component_with_translations.subtitle')
  end
end
