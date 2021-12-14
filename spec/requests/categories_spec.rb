require 'rails_helper'

RSpec.describe "Categories", type: :request do
    it "カスタムカテゴリを一つ作成し、その情報を読み出す。" do
        post user_categories_path("hoge"), params: {
            category: {
                name: "test",
                big_category: "fixed_cost",
                user_id: "hoge"
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        category_id = json["id"]

        get user_category_path("hoge", category_id)

        expect(response).to have_http_status(200)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
    end

    it "カスタムカテゴリを作成して、削除する。" do
        post user_categories_path("hoge"), params: {
            category: {
                name: "test",
                big_category: "fixed_cost",
                user_id: "hoge"
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        category_id = json["id"]

        delete user_category_path("hoge", category_id)

        expect(response).to have_http_status(:no_content)
    end

    it "カスタムカテゴリを作成して、内容を編集する。" do
        post user_categories_path("hoge"), params: {
            category: {
                name: "test",
                big_category: "fixed_cost",
                user_id: "hoge"
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        category_id = json["id"]

        patch user_category_path("hoge", category_id), params: {
            category: {
                name: "edit!"
            }
        }

        expect(response).to have_http_status(202)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "edit!"
    end
    
    it "カテゴリ情報一覧の取得ができる" do
        
    end
    
end
