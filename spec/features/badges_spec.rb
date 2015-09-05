# require 'rails_helper'
#
#
# feature "Getting Badges:" do
#
#   before(:each) { page.driver.browser.manage.window.resize_to(1024, 768) }
#   
#   # TODO rewrite specs for Sidekiq
#
#   scenario "User gets noob badge for signing up", js: true do
#
#     visit root_path
#     click_link "Signup"
#
#     fill_in 'Email', with: "jeff@delaney.com"
#     fill_in 'Password', with: "redalert"
#     click_button 'Sign up'
#
#     click_button 'Close'
#
#     expect(User.last.email).to eq("jeff@delaney.com")
#     expect(User.last.badges).to include(Merit::Badge.find(101)) # noob badge
#     expect(User.last.badges).to include(Merit::Badge.find(703)) # pioneer badge
#     expect(User.last.badges).to_not include(Merit::Badge.find(102))
#     expect(User.last.badges.count).to eq(2)
#
#
#   end
#
#   scenario "User gets badges for editing profile", js: true do
#
#     visit root_path
#     click_link "Login"
#     fill_in 'Email', with: "jeff@delaney.com"
#     fill_in 'Password', with: "redalert"
#     click_button 'Login'
#
#     click_on "My Account"
#     click_link "Edit Profile"
#
#     fill_in 'Bio', with: "one cool dude"
#     fill_in 'Blog', with: "http://myblog.com"
#     fill_in 'Boat Name', with: "starfire"
#     click_on "Update Profile"
#
#     expect(page).to have_content("Profile Updated!")
#
#     click_on "My Account"
#     click_on "Dashboard"
#
#     expect(User.last.email).to eq("jeff@delaney.com")
#     expect(page).to have_content("autobiographer")
#     expect(page).to have_content("blogger")
#     expect(page).to have_content("owneroperator")
#     expect(page).to have_content("pioneer")
#     #expect(User.last.badges).to include(Merit::Badge.find(2))
#     #expect(User.last.badges).to include(Merit::Badge.find(17))
#     #expect(User.last.badges).to include(Merit::Badge.find(18))
#
#   end
#
#   scenario "User gets badge creating an experience", js: true do
#
#     Location.create!(name: "Smuggler's Cove")
#
#     visit root_path
#     click_link "Login"
#     fill_in 'Email', with: "jeff@delaney.com"
#     fill_in 'Password', with: "redalert"
#     click_button 'Login'
#
#     visit locations_path
#     click_link "View Location"
#
#     expect(page).to have_content("Share Experience")
#     click_link "Share Experience"
#
#     fill_in 'Body', with: "one cool place to be"
#     click_link "Submit"
#
#     expect(page).to have_content("one cool place to be")
#
#     click_on "My Account"
#     click_on "Dashboard"
#
#     expect(page).to have_content("daysailor") #badge 201
#
#   end
#
#   #scenario "User gets a badge for uploading an image", js: true do
#   #end
#
#   #scenario "User gets a badge for anchoring content", js: true do
#   #end
#
#
# end
