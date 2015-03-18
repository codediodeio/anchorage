require 'rails_helper'

RSpec.describe "experiences/show", type: :view do
  before(:each) do
    @experience = assign(:experience, Experience.create!(
      :user => nil,
      :location => nil,
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
