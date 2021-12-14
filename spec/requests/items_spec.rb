require 'rails_helper'

RSpec.describe "Items", type: :request do
    it "収支情報を一つ作成し、その情報を読み出す。" do
        category = FactoryBot.create(:category, user_id: "hoge")
        payment_method = FactoryBot.create(:payment_method, user_id: "hoge")

        post user_items_path("hoge"), params: {
            item: {
                name: "test",
                user_id: "hoge",
                price: 1000,
                date: Date.today,
                note: "test",
                category_id: category.id,
                payment_method_id: payment_method.id
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        item_id = json["id"]

        get user_item_path("hoge", item_id)

        expect(response).to have_http_status(200)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
    end

    it "収支情報を作成して、削除する。" do
        category = FactoryBot.create(:category, user_id: "hoge")
        payment_method = FactoryBot.create(:payment_method, user_id: "hoge")

        post user_items_path("hoge"), params: {
            item: {
                name: "test",
                user_id: "hoge",
                price: 1000,
                date: Date.today,
                note: "test",
                category_id: category.id,
                payment_method_id: payment_method.id
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        item_id = json["id"]

        delete user_item_path("hoge", item_id)

        expect(response).to have_http_status(:no_content)

        get user_items_path("hoge")

        expect(response).to have_http_status(200)
        json = JSON.parse(response.body)
        expect(json.length).to eq 0
    end

    it "収支情報を作成して、内容を編集する。" do
        category = FactoryBot.create(:category, user_id: "hoge")
        payment_method = FactoryBot.create(:payment_method, user_id: "hoge")

        post user_items_path("hoge"), params: {
            item: {
                name: "test",
                user_id: "hoge",
                price: 1000,
                date: Date.today,
                note: "test",
                category_id: category.id,
                payment_method_id: payment_method.id
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        item_id = json["id"]

        patch user_item_path("hoge", item_id), params: {
            item: {
                name: "edit!"
            }
        }

        expect(response).to have_http_status(202)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "edit!"
    end
    
    it "収支情報一覧の取得ができる" do
        FactoryBot.create(:item, user_id: "hoge")

        get user_items_path("hoge")

        expect(response).to have_http_status(200)
        json = JSON.parse(response.body)
        expect(json.length).to eq 1
    end

end
