require 'rails_helper'

RSpec.describe "MoneyInfos", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/money_infos/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/money_infos/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/money_infos/update"
      expect(response).to have_http_status(:success)
    end
  end

end
