require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        :file => "File",
        :description => "MyText",
        :user => nil,
        :location => nil
      ),
      Image.create!(
        :file => "File",
        :description => "MyText",
        :user => nil,
        :location => nil
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", :text => "File".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
