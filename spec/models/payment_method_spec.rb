require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do
  describe "validationチェック" do
    context "有効な条件" do
      it ":name, :income, :user_idがあれば有効なこと" do
        expect(FactoryBot.create(:payment_method)).to be_valid
      end

      it ":user_idが無くても有効なこと" do
        expect(FactoryBot.create(:payment_method, user_id: nil)).to be_valid
      end

      it ":incomeがtrueの時有効なこと" do
        expect(FactoryBot.create(:payment_method, income: true)).to be_valid
      end

      it ":nameが50字の時有効なこと" do
        payment_method = FactoryBot.build(:payment_method, name: "a" * 50)
        payment_method.valid?
        expect(payment_method.errors[:name]).to be_empty
      end

      it ":user_idが別であれば、:nameが同じでも有効なこと" do
        FactoryBot.create(:payment_method, name: "example", user_id: "1234")
        payment_method = FactoryBot.build(:payment_method, name: "example", user_id: "5678")
        payment_method.valid?
        expect(payment_method.errors[:name]).to be_empty
      end 
    end

    context "無効な条件" do
      it ":nameがない場合無効なこと" do
        payment_method = FactoryBot.build(:payment_method, name: nil)
        payment_method.valid?
        expect(payment_method.errors[:name]).to include("を入力してください") 
      end

      it ":incomeがない場合無効なこと" do
        payment_method = FactoryBot.build(:payment_method, income: nil)
        payment_method.valid?
        expect(payment_method.errors[:income]).to include("は一覧にありません")
      end
      
      it ":nameが51字の場合無効なこと" do
        payment_method = FactoryBot.build(:payment_method, name: "a" * 51)
        payment_method.valid?
        expect(payment_method.errors[:name]).to include("は50文字以内で入力してください")
      end

      it "同一:user_id、同一:nameの時無効なこと" do
        FactoryBot.create(:payment_method, name: "example", user_id: "1234")
        payment_method = FactoryBot.build(:payment_method, name: "example", user_id: "1234")
        payment_method.valid?
        expect(payment_method.errors[:name]).to include("はすでに存在します")
      end
    end
  end
end
