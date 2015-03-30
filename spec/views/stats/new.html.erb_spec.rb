require 'rails_helper'

RSpec.describe "stats/new", type: :view do
  before(:each) do
    assign(:stat, Stat.new(
      :location => nil,
      :lat => "9.99",
      :long => "9.99",
      :description => "MyText",
      :fuel => false,
      :slips => 1,
      :moorings => "MyString",
      :integer => "MyString",
      :protection => "MyString",
      :type => "",
      :cost => "MyString",
      :protection => "MyString",
      :pstart => 1,
      :pend => 1
    ))
  end

  it "renders new stat form" do
    render

    assert_select "form[action=?][method=?]", stats_path, "post" do

      assert_select "input#stat_location_id[name=?]", "stat[location_id]"

      assert_select "input#stat_lat[name=?]", "stat[lat]"

      assert_select "input#stat_long[name=?]", "stat[long]"

      assert_select "textarea#stat_description[name=?]", "stat[description]"

      assert_select "input#stat_fuel[name=?]", "stat[fuel]"

      assert_select "input#stat_slips[name=?]", "stat[slips]"

      assert_select "input#stat_moorings[name=?]", "stat[moorings]"

      assert_select "input#stat_integer[name=?]", "stat[integer]"

      assert_select "input#stat_protection[name=?]", "stat[protection]"

      assert_select "input#stat_type[name=?]", "stat[type]"

      assert_select "input#stat_cost[name=?]", "stat[cost]"

      assert_select "input#stat_protection[name=?]", "stat[protection]"

      assert_select "input#stat_pstart[name=?]", "stat[pstart]"

      assert_select "input#stat_pend[name=?]", "stat[pend]"
    end
  end
end
