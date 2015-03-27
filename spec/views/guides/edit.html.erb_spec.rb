require 'rails_helper'

RSpec.describe "guides/edit", type: :view do
  before(:each) do
    @guide = assign(:guide, Guide.create!(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit guide form" do
    render

    assert_select "form[action=?][method=?]", guide_path(@guide), "post" do

      assert_select "input#guide_name[name=?]", "guide[name]"

      assert_select "input#guide_user_id[name=?]", "guide[user_id]"
    end
  end
end
