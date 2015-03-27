require 'rails_helper'

RSpec.describe "Guides", type: :request do
  describe "GET /guides" do
    it "works! (now write some real specs)" do
      get guides_path
      expect(response).to have_http_status(200)
    end
  end
end
