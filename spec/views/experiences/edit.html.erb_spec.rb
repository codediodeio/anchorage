require 'rails_helper'

RSpec.describe "experiences/edit", type: :view do
  before(:each) do
    @experience = assign(:experience, Experience.create!(
      :user => nil,
      :location => nil,
      :body => "MyText"
    ))
  end

  it "renders the edit experience form" do
    render

    assert_select "form[action=?][method=?]", experience_path(@experience), "post" do

      assert_select "input#experience_user_id[name=?]", "experience[user_id]"

      assert_select "input#experience_location_id[name=?]", "experience[location_id]"

      assert_select "textarea#experience_body[name=?]", "experience[body]"
    end
  end
end
