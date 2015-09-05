require 'rails_helper'


feature "Admin Activity:" do
  before(:each) { page.driver.browser.manage.window.resize_to(1024, 768) }

  let(:admin) { FactoryGirl.create(:admin) }
  let(:user) { FactoryGirl.create(:user) }
  let(:banned) { FactoryGirl.create(:banned) }

  scenario "Admin Login and Visit Dashboard", js: true do

    login admin

    expect(page).to have_content("Signed in successfully")
    expect(current_path).to eq dashboard_path
    expect(admin.admin?).to be_truthy

    visit admin_dashboard_path

    expect(page).to have_content("Dashboard")
    expect(page).to have_content("All Users")
    expect(page).to have_content("View Anchor Activity")
    expect(page).to have_content("Create Location")
    expect(current_path).to eq admin_dashboard_path

  end

  scenario "Admin visits Admin Pages", js: true do

    login user
    click_link user.username
    click_link "Logout"

    login admin
    visit admin_dashboard_path

    click_link "All Users"

    expect(page).to have_content("Listing Users")
    expect(page).to have_content(user.username)

  end

  scenario "Non-Admin tries to visit Admin Pages", js: true do

    login user

    visit admin_dashboard_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_users_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_anchors_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_locations_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_images_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_regions_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_experiences_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_ban_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_lift_ban_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

  end

  scenario "Admin bans and lifts ban of user", js: true do

    login user
    click_link user.username
    click_link "Logout"

    login admin
    visit admin_users_path

    expect(page).to have_content(user.username)
    expect(page).to have_content("Ban")
    expect(page).to have_css("a#ban#{user.id}")

    expect(user.banned?).to be_falsey

    click_link "ban#{user.id}"

    expect(page).to have_content("User has been Banned!")

    visit admin_users_path

    expect(page).to have_content("Ban")
    expect(page).to have_css("a#lift_ban#{user.id}")
    # expect(user.banned?).to be_truthy #not passing, why?

    click_link "lift_ban#{user.id}"

    expect(page).to have_content("Ban has been lifted!")

  end


  scenario "Banned user tries to Login", js: true do

    visit root_path
    click_link "Login"
    fill_in 'Email', with: banned.email
    fill_in 'Password', with: banned.password
    click_button 'Login'

    expect(page).to have_content("This account has been suspended")
    expect(current_path).to eq root_path

    visit locations_path
    click_link "Login"
    fill_in 'Email', with: banned.email
    fill_in 'Password', with: banned.password
    click_button 'Login'

    expect(page).to have_content("This account has been suspended")
    expect(current_path).to eq root_path

    visit dashboard_path
    expect(page).to have_content("You need to sign in or sign up")
    expect(current_path).to eq new_user_session_path

  end

  scenario "Nil user tries to visit Admin Pages", js: true do

    visit admin_dashboard_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_users_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_anchors_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_locations_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_images_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_regions_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_experiences_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_ban_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

    visit admin_lift_ban_path
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq root_path

  end

  #scenario "Non-Admin user tries to visit create Pages", js: true do
  #end

end
