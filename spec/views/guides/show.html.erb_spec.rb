require 'rails_helper'

RSpec.describe "guides/show", type: :view do
  before(:each) do
    @guide = assign(:guide, Guide.create!(
      :name => "Name",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
