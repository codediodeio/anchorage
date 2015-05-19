require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :title => "MyString",
      :body => "MyText",
      :author => "MyString",
      :featured_image => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post_body[name=?]", "post[body]"

      assert_select "input#post_author[name=?]", "post[author]"

      assert_select "input#post_featured_image[name=?]", "post[featured_image]"

      assert_select "input#post_description[name=?]", "post[description]"
    end
  end
end
