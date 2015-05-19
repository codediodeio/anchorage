require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "MyString",
      :body => "MyText",
      :author => "MyString",
      :featured_image => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post_body[name=?]", "post[body]"

      assert_select "input#post_author[name=?]", "post[author]"

      assert_select "input#post_featured_image[name=?]", "post[featured_image]"

      assert_select "input#post_description[name=?]", "post[description]"
    end
  end
end
