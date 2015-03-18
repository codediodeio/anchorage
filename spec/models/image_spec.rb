require 'rails_helper'

RSpec.describe Image, type: :model do

  it { is_expected.to respond_to(:file, :description) }
  it { is_expected.to respond_to(:user, :location) }
  it { is_expected.to respond_to(:anchors, :anchored_users) }

  context "image file is missing" do
    let(:image) { Image.new(file: "") }

    it "should not be valid" do
      expect(image).not_to be_valid
    end

    it "should raise a validation exception" do
      expect { image.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    
  end

  #context "when file size is too large" do
  #end

  #context "when user has uploaded too many images" do
  #end


end
