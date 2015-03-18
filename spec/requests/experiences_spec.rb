require 'rails_helper'

RSpec.describe "Experiences", type: :request do
  describe "GET /experiences" do
    it "works! (now write some real specs)" do
      get experiences_path
      expect(response).to have_http_status(200)
    end
  end
end
