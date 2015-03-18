require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to respond_to(:email, :password) }
  it { is_expected.to respond_to(:username, :bio, :boatname, :boatmodel, :location) }
  it { is_expected.to respond_to(:experiences, :images) }
  it { is_expected.to respond_to(:anchors, :anchored_experiences, :anchored_images) }

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
    let(:experience) { user.experiences.create!(body: "Hello", location_id: location.id) }

    it "should be valid" do
      expect(experience).to be_valid
    end

    it "should should increase experiences by 1" do
      expect { user.anchor!(experience) }.to change{ user.experiences.count }.by(1)
    end

  end

  context "when a user anchors an experience" do

  let(:user) { FactoryGirl.create(:user) }
  let(:experience) { FactoryGirl.create(:experience) }
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

    it "should should increase anchors by 1" do
      expect { anchor }.to change{ user.anchors.count }.by(1)
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

    it "should return an associated experience with anchor? method" do
      anchor
      anchor_object = user.anchor?(experience)
      expect( anchor_object.user.id ).to eq(user.id)
      expect( anchor_object.anchorable_type ).to eq("Experience")
    end

  end

  context "when a user unanchors an experience" do

  let(:user) { FactoryGirl.create(:user) }
  let(:experience) { FactoryGirl.create(:experience) }
  let(:anchor) { user.anchor!(experience) }

    it "should should decrease anchors by 1" do
      anchor
      expect{ user.unanchor!(experience) }.to change{ user.anchors.count }.by(-1)
    end

  end


  context "when a user anchors an image" do

    let(:user) { FactoryGirl.create(:user) }
    let(:image) { FactoryGirl.create(:image) }
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
    let(:image) { FactoryGirl.create(:image) }
    let(:anchor) { user.anchor!(image) }

    it "should should decrease anchors by 1" do
      anchor
      expect{ user.unanchor!(image) }.to change{ user.anchors.count }.by(-1)
    end

  end



end
