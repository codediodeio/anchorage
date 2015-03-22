require 'rails_helper'

RSpec.describe Anchor, type: :model do

  it { is_expected.to respond_to(:user_id, :anchorable_id, :anchorable_type) }
  it { is_expected.to respond_to(:anchorable) }

  let(:user) { FactoryGirl.create(:user) }
  let(:location) { FactoryGirl.create(:location) }
  let(:experience) { FactoryGirl.create(:experience) }
  let(:anchor) { Anchor.create(user_id: user.id, anchorable_id: experience.id, anchorable_type: experience.class.name) }

  context "when a valid anchor is created" do

    it "should be valid" do
      expect(anchor).to be_valid
    end

  end

  context "user attempts to anchor their own experience" do

    let(:experience_user) { Experience.create(body: "hello", user_id: user.id, location_id: location.id) }
    let(:anchor_own) { Anchor.create(user_id: user.id, anchorable_id: experience_user.id, anchorable_type: experience_user.class.name) }

    it "should not be valid" do
      expect(anchor_own).not_to be_valid
    end

  end

end
