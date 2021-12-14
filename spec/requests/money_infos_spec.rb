require 'rails_helper'

RSpec.describe "MoneyInfos", type: :request do
    it "資産情報を作成し、情報を読み出す" do
        post user_money_info_path("hoge"), params: {
            money_info: {
                total_assets: 1000000,
                target_amount: 3000000,
                deadline: Date.today,
                monthly_budget: 100000,
                user_id: "hoge"
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["total_assets"]).to eq 1000000
        id = json["id"]

        get user_money_info_path("hoge", id)

        expect(response).to have_http_status(200)
        json = JSON.parse(response.body)
        expect(json["total_assets"]).to eq 1000000
    end

    it "資産情報を作成して、内容を編集する" do
        post user_money_info_path("hoge"), params: {
            money_info: {
                total_assets: 1000000,
                target_amount: 3000000,
                deadline: Date.today,
                monthly_budget: 100000,
                user_id: "hoge"
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["total_assets"]).to eq 1000000
        id = json["id"]

        patch user_money_info_path("hoge", id), params: {
            money_info: {
                total_assets: 10000000
            }
        }

        expect(response).to have_http_status(202)
        json = JSON.parse(response.body)
        expect(json["total_assets"]).to eq 10000000
    end
end
