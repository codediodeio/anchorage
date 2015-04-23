require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to respond_to(:email, :password) }
  it { is_expected.to respond_to(:username, :bio, :boatname, :boatmodel, :location) }
  it { is_expected.to respond_to(:experiences, :images) }
  it { is_expected.to respond_to(:anchors, :anchored_experiences, :anchored_images) }
  it { is_expected.to respond_to(:badges) }
  it { is_expected.to respond_to(:total_anchors) }

  context "when a new user is created" do
    let(:user) { FactoryGirl.create(:user) }

    it "should be valid" do
      expect(user).to be_valid
    end

    it "should be generate a username" do
      expect(user.username).not_to be_empty
    end

    it "should not be an admin user" do
      expect(user.admin?).to be_falsey
    end

    it "should not be an banned" do
      expect(user.banned?).to be_falsey
    end

  end

  context "when a user is an admin" do
    let(:admin) { FactoryGirl.create(:admin) }

    it "should be valid" do
      expect(admin).to be_valid
    end

  end


  context "when email address is missing" do
    let(:user) { User.new(email: "") }

    it "should not be valid" do
      expect(user).not_to be_valid
    end

    it "should raise a validation exception" do
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

  context "when a user creates an experience" do

    let(:user) { FactoryGirl.create(:user) }
    let(:location) { FactoryGirl.create(:location) }
    let(:experience) { user.experiences.create!(body: "Hello"*10, location_id: location.id) }

    it "should be valid" do
      expect(experience).to be_valid
    end

    it "should not be anchorable by this user" do
      expect { user.anchor!(experience) }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

  context "when a user anchors an experience" do

  let(:user) { FactoryGirl.create(:user) }
  let(:user_two) { FactoryGirl.create(:user_two) }
  let(:location) { FactoryGirl.create(:location) }
  let(:experience) { user_two.experiences.create!(body: "Hello"*10, location_id: location.id) }
  let(:anchor) { user.anchor!(experience) }

    it "should be valid" do
      expect(anchor).to be_valid
    end

    it "should be associated with the user object" do
      expect(anchor.user).to be(user)
    end

    it "should be associated with the experience object" do
      expect(anchor.anchorable).to eq(experience)
    end

    it "should should not be the same as the experience user" do
      expect(anchor.anchorable.user).not_to eq(user)
    end

    it "should should user increase anchors by 1" do
      expect { anchor }.to change{ user.anchors.count }.by(1)
    end

    it "should should not increase anchors received" do
      expect { anchor }.not_to change{ user.total_anchors }
    end

    it "should should not increase image anchors" do
      expect { anchor }.not_to change{ user.anchored_images }
    end

    it "should should increse total anchors received of anchorable user" do
      expect { anchor }.to change{ user_two.total_anchors }.by(1)
    end

    it "should should increase anchored_users by 1" do
      expect { anchor }.to change{ experience.anchored_users.count }.by(1)
    end

    it "should should increase anchored_experiences by 1" do
      expect { anchor }.to change{ user.anchored_experiences.count }.by(1)
    end

    it "should should not increase anchored_images by 1" do
      expect { anchor }.to_not change(user.anchored_images, :count)
    end

    it "should return an associated true with anchor? method" do
      anchor
      anchor_test = user.anchor?(experience)
      expect( anchor_test ).to eq(true)
    end

  end

  context "when a user unanchors an experience" do

  let(:user) { FactoryGirl.create(:user) }
  let(:user_two) { FactoryGirl.create(:user_two) }
  let(:location) { FactoryGirl.create(:location) }
  let(:experience) { user_two.experiences.create!(body: "Hello"*10, location_id: location.id) }
  let(:anchor) { user.anchor!(experience) }

    it "should should decrease anchors by 1" do
      anchor
      expect{ user.unanchor!(experience) }.to change{ user.anchors.count }.by(-1)
    end

  end

=begin IMAGE SPECS NEED TO BE MOCKED

  context "when a user anchors an image" do

    let(:user) { FactoryGirl.create(:user) }
    let(:user_two) { FactoryGirl.create(:user_two) }
    let(:location) { FactoryGirl.create(:location) }
    let(:image) { user_two.images.create!(file: "photo.jpg", description: "Hello", location_id: location.id) }
    let(:anchor) { user.anchor!(image) }

    it "should be valid" do
      expect(anchor).to be_valid
    end

    it "should be associated with the user object" do
      expect(anchor.user).to be(user)
    end

    it "should be associated with the image object" do
      expect(anchor.anchorable).to eq(image)
    end

    it "should should not be the same as the image user" do
      expect(anchor.anchorable.user).not_to eq(user)
    end

    it "should should increase anchors by 1" do
      expect { anchor }.to change{ user.anchors.count }.by(1)
    end

    it "should should increase image's anchored_users by 1" do
      expect { anchor }.to change{ image.anchored_users.count }.by(1)
    end

    it "should should increase anchored_images by 1" do
      expect { anchor }.to change{ user.anchored_images.count }.by(1)
    end

    it "should should not increase anchored_experiences by 1" do
      expect { anchor }.to_not change(user.anchored_experiences, :count)
    end

    it "should return an associated image with anchor? method" do
      anchor
      anchor_object = user.anchor?(image)
      expect( anchor_object.user.id ).to eq(user.id)
      expect( anchor_object.anchorable_type ).to eq("Image")
    end

  end

  context "when a user unanchors an image" do

    let(:user) { FactoryGirl.create(:user) }
    let(:user_two) { FactoryGirl.create(:user_two) }
    let(:location) { FactoryGirl.create(:location) }
    let(:image) { user_two.images.create!(file: "photo.jpg", description: "Hello", location_id: location.id) }
    let(:anchor) { user.anchor!(image) }

    it "should should decrease anchors by 1" do
      anchor
      expect{ user.unanchor!(image) }.to change{ user.anchors.count }.by(-1)
    end

  end
=end

  context "when a user enters invalid profile attributes" do
    let(:user) { FactoryGirl.create(:user) }

    it "should not have a username shorter than 3 characters" do
      user.username = "je"
      expect(user).not_to be_valid
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not have a username shorter than 20 characters" do
      user.username = ("j")*21
      expect(user).not_to be_valid
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not have a blank username" do
      user.username = ("")
      expect(user).not_to be_valid
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not have a username with whitespace" do
      user.username = ("jeff delaney")
      expect(user).not_to be_valid
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not have a username with weird characters" do
      user.username = ("!blam#@@()")
      expect(user).not_to be_valid
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not have a bio longer than 2000 characters" do
      user.bio = "j"*2001
      expect(user).not_to be_valid
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not have a location longer than 30 characters" do
      user.location = "j"*31
      expect(user).not_to be_valid
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not have a boatname longer than 30 characters" do
      user.boatname = "j"*31
      expect(user).not_to be_valid
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not have a boat model longer than 30 characters" do
      user.boatmodel = "j"*31
      expect(user).not_to be_valid
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not have a boat model longer than 20 characters" do
      user.fname = "j"*21
      expect(user).not_to be_valid
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not have a last name longer than 20 characters" do
      user.lname = "j"*21
      expect(user).not_to be_valid
      expect{ user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end


end
