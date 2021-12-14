require 'rails_helper'

RSpec.describe "PaymentMethods", type: :request do
    it "カスタム支払情報を一つ作成し、その情報を読み出す。" do
        post user_payment_methods_path("hoge"), params: {
            payment_method: {
                name: "test",
                income: true,
                user_id: "hoge"
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        payment_method_id = json["id"]

        get user_payment_method_path("hoge", payment_method_id)

        expect(response).to have_http_status(200)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
    end

    it "カスタム支払情報を作成して、削除する。" do
        post user_payment_methods_path("hoge"), params: {
            payment_method: {
                name: "test",
                income: true,
                user_id: "hoge"
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        payment_method_id = json["id"]

        delete user_payment_method_path("hoge", payment_method_id)

        expect(response).to have_http_status(:no_content)

        get user_payment_methods_path("hoge")

        expect(response).to have_http_status(200)
        json = JSON.parse(response.body)
        expect(json.length).to eq 0
    end

    it "カスタム支払情報を作成して、内容を編集する。" do
        post user_payment_methods_path("hoge"), params: {
            payment_method: {
                name: "test",
                income: true,
                user_id: "hoge"
            }
        }

        expect(response).to have_http_status(201)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "test"
        payment_method_id = json["id"]

        patch user_payment_method_path("hoge", payment_method_id), params: {
            payment_method: {
                name: "edit!"
            }
        }

        expect(response).to have_http_status(202)
        json = JSON.parse(response.body)
        expect(json["name"]).to eq "edit!"
    end
    
    it "支払情報一覧の取得ができる" do
        FactoryBot.create(:payment_method, user_id: "hoge")
        FactoryBot.create(:payment_method, user_id: nil)

        get user_payment_methods_path("hoge")

        expect(response).to have_http_status(200)
        json = JSON.parse(response.body)
        expect(json.length).to eq 2
    end

end
