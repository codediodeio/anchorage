require 'rails_helper'

RSpec.describe Location, type: :model, focus: true do

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:experiences, :stat, :images) }

  context "with valid attributes" do
    let(:location) { Location.new(name: "Channel Islands") }

    it "should be valid" do
      expect(location).to be_valid
    end

    it "should create a stat sheet after being created" do
      expect(location.stat).to be_nil
      location.save
      location.reload
      expect(location.stat).not_to be_nil
    end
  end

  context "with missing name" do
    let(:location) { Location.new(name: "") }

    it "should not be valid" do
      expect(location).not_to be_valid
    end
  end

end
