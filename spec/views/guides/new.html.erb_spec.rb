require 'rails_helper'

RSpec.describe "guides/new", type: :view do
  before(:each) do
    assign(:guide, Guide.new(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders new guide form" do
    render

    assert_select "form[action=?][method=?]", guides_path, "post" do

      assert_select "input#guide_name[name=?]", "guide[name]"

      assert_select "input#guide_user_id[name=?]", "guide[user_id]"
    end
  end
end
