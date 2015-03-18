require 'rails_helper'

RSpec.describe "images/edit", type: :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      :file => "MyString",
      :description => "MyText",
      :user => nil,
      :location => nil
    ))
  end

  it "renders the edit image form" do
    render

    assert_select "form[action=?][method=?]", image_path(@image), "post" do

      assert_select "input#image_file[name=?]", "image[file]"

      assert_select "textarea#image_description[name=?]", "image[description]"

      assert_select "input#image_user_id[name=?]", "image[user_id]"

      assert_select "input#image_location_id[name=?]", "image[location_id]"
    end
  end
end
