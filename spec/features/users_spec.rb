require 'rails_helper'

feature "User Activity:" do

  let(:user) { FactoryGirl.create(:user) }

  scenario "User signs up" do

    visit signup_path

    expect(current_path).to eq signup_path
    expect(page).to have_content("New User Signup")

  end

end
