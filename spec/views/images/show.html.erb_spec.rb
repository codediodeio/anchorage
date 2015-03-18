require 'rails_helper'

RSpec.describe "images/show", type: :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      :file => "File",
      :description => "MyText",
      :user => nil,
      :location => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/File/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
