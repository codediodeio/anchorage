require 'rails_helper'

RSpec.describe "experiences/new", type: :view do
  before(:each) do
    assign(:experience, Experience.new(
      :user => nil,
      :location => nil,
      :body => "MyText"
    ))
  end

  it "renders new experience form" do
    render

    assert_select "form[action=?][method=?]", experiences_path, "post" do

      assert_select "input#experience_user_id[name=?]", "experience[user_id]"

      assert_select "input#experience_location_id[name=?]", "experience[location_id]"

      assert_select "textarea#experience_body[name=?]", "experience[body]"
    end
  end
end
