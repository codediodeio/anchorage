require 'rails_helper'


feature "User Activity:" do
  before(:each) { page.driver.browser.manage.window.resize_to(1024, 768) }

  let(:user) { FactoryGirl.create(:user) }
  let(:location) { FactoryGirl.create(:location) }

=begin

  scenario "User signs up", js: true do

    visit root_path
    click_link "Signup"

    expect(page).to have_content("Sign up")
    expect(page).to have_css("div#regModal")

    fill_in 'Email', with: "jeff@delaney.com"
    fill_in 'Password', with: "redalert"
    click_button 'Sign up'

    expect(page).to have_css("div#welcomeModal")

    click_button 'Close'

    expect(page).not_to have_content("Dashboard")
    expect(User.last.email).to eq("jeff@delaney.com")
    expect(User.last.admin?).to be_falsey


  end

  scenario "User logs in", js: true do
    visit root_path
    click_link "Login"

    expect(page).to have_content("Login")
    expect(page).to have_css("div#seshModal")

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("My Account")
  end

  scenario "User logs out", js: true do

    login user

    click_on "My Account"
    click_link "Logout"

    expect(page).to have_content("Signed out successfully")
    expect(page).not_to have_content("Dashboard")
  end


  scenario "User edits profile", js: true do

    login user

    click_on "My Account"
    click_link "Edit Profile"

    expect(page).to have_content("Edit Profile")
    expect(page).to have_css("div#editModal")

    fill_in 'Username', with: "jeffd23"
    fill_in 'Bio', with: "one cool dude"
    fill_in 'Boat Name', with: "starfire"
    fill_in 'Boat Make and Model', with: "Islander 32"
    click_on "Update Profile"

    expect(page).to have_content("Profile Updated!")
    expect(page).not_to have_content("Signup")

  end

=end

=begin

  scenario "User creates an Experience", js: true do

    expect(location.name).to eq("Smugglers Cove")

    login user

    visit locations_path
    expect(page).to have_content(location.name)

    click_link "Smugglers Cove"

    expect(current_path).to eq location_path(location)
    expect(page).to have_content("Share Experience")

    click_link "Share Experience"
    expect(page).to have_content("Ground Rules")

    find(".wysihtml5-sandbox")

    fill_in "body", with: "My First Experience"
    click_on "Submit"

    expect(page).to have_content("My First Experience")

  end

=end


end
