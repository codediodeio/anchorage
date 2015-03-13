require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do

    it "returns does not http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
