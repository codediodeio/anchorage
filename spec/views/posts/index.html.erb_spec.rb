require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "Title",
        :body => "MyText",
        :author => "Author",
        :featured_image => "Featured Image",
        :description => "Description"
      ),
      Post.create!(
        :title => "Title",
        :body => "MyText",
        :author => "Author",
        :featured_image => "Featured Image",
        :description => "Description"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Featured Image".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
