require 'rails_helper'

RSpec.describe "stats/show", type: :view do
  before(:each) do
    @stat = assign(:stat, Stat.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Moorings/)
    expect(rendered).to match(/Integer/)
    expect(rendered).to match(/Protection/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Cost/)
    expect(rendered).to match(/Protection/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
