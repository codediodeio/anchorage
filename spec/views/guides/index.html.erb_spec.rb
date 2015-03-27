require 'rails_helper'

RSpec.describe "guides/index", type: :view do
  before(:each) do
    assign(:guides, [
      Guide.create!(
        :name => "Name",
        :user => nil
      ),
      Guide.create!(
        :name => "Name",
        :user => nil
      )
    ])
  end

  it "renders a list of guides" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
