require 'rails_helper'


feature "Conversations", type: :feature do

  let(:sender) { FactoryGirl.create(:user) }
  let(:recipient) { FactoryGirl.create(:user_two) }

  context "when a new conversation is started" do

    it "should start with the conversation button" do
      quick_login(sender)
      visit profile_path(recipient.username)
      expect(page).to have_content("message @#{recipient.username}")
      click_on "message"
      expect(current_path).to eq(conversation_path(recipient.username))
    end

    it "should create a new message instance" do
      quick_login(sender)
      visit conversation_path(recipient.username)
      fill_in 'Message', with: "Howdy Partner!"
      click_on 'Send'
    end


  end




end
