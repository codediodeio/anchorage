require 'rails_helper'

RSpec.describe Experience, type: :model do

  it { is_expected.to respond_to(:body) }
  it { is_expected.to respond_to(:user, :location) }

end
