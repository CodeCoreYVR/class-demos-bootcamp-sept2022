require 'rails_helper'

RSpec.describe "Callbacks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/callbacks/index"
      expect(response).to have_http_status(:success)
    end
  end

end
