require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:email).with(0).arguments }
  it { is_expected.to respond_to(:equal?).with(1).arguments }
  it { is_expected.to respond_to(:username, :bio, :boatname, :boatmodel, :location) }

  context "when email address is missing" do
    let(:user) { User.new(email: "") }
    
    it "should not be valid" do
      expect(user).not_to be_valid
    end

    it "should raise a validation exception" do
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end



end
