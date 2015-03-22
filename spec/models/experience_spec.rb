require 'rails_helper'

RSpec.describe Experience, type: :model do

  it { is_expected.to respond_to(:body) }
  it { is_expected.to respond_to(:user, :location) }

  let(:user) { FactoryGirl.create(:user) }
  let(:location) { FactoryGirl.create(:location) }
  let(:experience) { Experience.create(body: "hello", user_id: user.id, location_id: location.id) }

  context "when a valid experience is created" do

    it "should be valid" do
      expect(experience).to be_valid
    end

  end

  context "when an experience is missing a body" do

    let(:experience_blank) { Experience.create(body: "", user_id: user.id, location_id: location.id) }

    it "should be valid" do
      expect(experience_blank).not_to be_valid
    end

  end

  context "when multiple experiences are created by the same user and location" do
    let(:experience_two) { Experience.new(body: "hello again", user_id: user.id, location_id: location.id) }

    it "should be not valid" do
      expect(experience).to be_valid
      expect(experience_two).not_to be_valid
      expect { experience_two.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end


end
