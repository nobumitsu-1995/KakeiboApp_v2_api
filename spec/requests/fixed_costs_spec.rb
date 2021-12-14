require 'rails_helper'

RSpec.describe "FixedCosts", type: :request do
    it "固定収支情報を一つ作成し、その情報を読み出す。" do
        category = FactoryBot.create(:category, user_id: "hoge")
        payment_method = FactoryBot.create(:payment_method, user_id: "hoge")

        post user_fixed_costs_path("hoge"), params: {
            fixed_cost: {
                name: "test",
                user_id: "hoge",
                price: 1000,
                scheduled_date: 1,
                note: "test",
                category_id: category.id,
                payment_method_id: payment_method.id
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        fixed_cost_id = json["id"]

        get user_fixed_cost_path("hoge", fixed_cost_id)

        expect(response).to have_http_status(200)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
    end

    it "固定収支情報を作成して、削除する。" do
        category = FactoryBot.create(:category, user_id: "hoge")
        payment_method = FactoryBot.create(:payment_method, user_id: "hoge")

        post user_fixed_costs_path("hoge"), params: {
            fixed_cost: {
                name: "test",
                user_id: "hoge",
                price: 1000,
                scheduled_date: 1,
                note: "test",
                category_id: category.id,
                payment_method_id: payment_method.id
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        fixed_cost_id = json["id"]

        delete user_fixed_cost_path("hoge", fixed_cost_id)

        expect(response).to have_http_status(:no_content)

        get user_fixed_costs_path("hoge")

        expect(response).to have_http_status(200)
        json = JSON.parse(response.body)
        expect(json.length).to eq 0
    end

    it "固定収支情報を作成して、内容を編集する。" do
        category = FactoryBot.create(:category, user_id: "hoge")
        payment_method = FactoryBot.create(:payment_method, user_id: "hoge")

        post user_fixed_costs_path("hoge"), params: {
            fixed_cost: {
                name: "test",
                user_id: "hoge",
                price: 1000,
                scheduled_date: 1,
                note: "test",
                category_id: category.id,
                payment_method_id: payment_method.id
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        fixed_cost_id = json["id"]

        patch user_fixed_cost_path("hoge", fixed_cost_id), params: {
            fixed_cost: {
                name: "edit!"
            }
        }

        expect(response).to have_http_status(202)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "edit!"
    end
    
    it "固定収支情報一覧の取得ができる" do
        FactoryBot.create(:fixed_cost, user_id: "hoge")

        get user_fixed_costs_path("hoge")

        expect(response).to have_http_status(200)
        json = JSON.parse(response.body)
        expect(json.length).to eq 1
    end
end
