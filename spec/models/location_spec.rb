require 'rails_helper'

RSpec.describe Location, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:experiences) }

  context "when it is valid" do
    let(:location) { Location.new(name: "Channel Islands") }

    it "should be valid" do
      expect(location).to be_valid
    end
  end

end
