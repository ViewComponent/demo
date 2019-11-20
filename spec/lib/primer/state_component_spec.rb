require "rails_helper"

RSpec.describe Primer::StateComponent do
  it "raises an error when content isn't passed" do
    exception = assert_raises ActiveModel::ValidationError do
      render_inline(Primer::StateComponent, title: 'Hi')
    end

    assert_includes exception.message, "Content can't be blank"
  end

  it "renders content passed to it as a block" do
    result = render_inline(Primer::StateComponent, color: :green, title: 'Hi') do
      "content"
    end

    assert_includes result.css(".State.State--green").text, "content"
  end

  it "raises an error when color is not one of valid values" do
    exception = assert_raises ActiveModel::ValidationError do
      render_inline(Primer::StateComponent, color: :chartreuse, title: 'Hi') do
        "foo"
      end
    end

    assert_includes exception.message, "Color is not included in the list"
  end

  it "raises an error when title is not present" do
    exception = assert_raises ActiveModel::ValidationError do
      render_inline(Primer::StateComponent, title: '') do
        "foo"
      end
    end

    assert_includes exception.message, "Title can't be blank"
  end

  it "assigns the correct CSS class for color" do
    result = render_inline(Primer::StateComponent, color: :purple, title: 'Hi') do
      "content"
    end

    assert result.css(".State.State--purple").any?
  end

  it "sets the title" do
    result = render_inline(Primer::StateComponent, title: 'Hi!') do
      "content"
    end

    assert result.css("[title='Hi!']").any?
  end
end
