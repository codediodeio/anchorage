require 'rails_helper'

RSpec.describe "stats/index", type: :view do
  before(:each) do
    assign(:stats, [
      Stat.create!(
        :location => nil,
        :lat => "9.99",
        :long => "9.99",
        :description => "MyText",
        :fuel => false,
        :slips => 1,
        :moorings => "Moorings",
        :integer => "Integer",
        :protection => "Protection",
        :type => "Type",
        :cost => "Cost",
        :protection => "Protection",
        :pstart => 2,
        :pend => 3
      ),
      Stat.create!(
        :location => nil,
        :lat => "9.99",
        :long => "9.99",
        :description => "MyText",
        :fuel => false,
        :slips => 1,
        :moorings => "Moorings",
        :integer => "Integer",
        :protection => "Protection",
        :type => "Type",
        :cost => "Cost",
        :protection => "Protection",
        :pstart => 2,
        :pend => 3
      )
    ])
  end

  it "renders a list of stats" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Moorings".to_s, :count => 2
    assert_select "tr>td", :text => "Integer".to_s, :count => 2
    assert_select "tr>td", :text => "Protection".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Cost".to_s, :count => 2
    assert_select "tr>td", :text => "Protection".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
