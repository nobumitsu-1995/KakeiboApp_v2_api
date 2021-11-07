require 'rails_helper'

RSpec.describe FixedCost, type: :model do
  describe "validationチェック" do
    context "有効な条件" do
      it ":name, :price, :scheduled_date, :note, :user_id, :category_id, :payment_method_idがある時有効なこと" do
        expect(FactoryBot.create(:fixed_cost)).to be_valid
      end

      it ":nameが50字の時有効なこと" do
        fixed_cost = FactoryBot.build(:fixed_cost, name: "a" * 50)
        fixed_cost.valid?
        expect(fixed_cost.errors[:name]).to be_empty
      end

      it ":noteが200字の時有効なこと" do
        fixed_cost = FactoryBot.build(:fixed_cost, note: "a" * 200)
        fixed_cost.valid?
        expect(fixed_cost.errors[:note]).to be_empty
      end

      it ":noteがnilでも有効なこと" do
        expect(FactoryBot.create(:fixed_cost, note: nil)).to be_valid
      end
      
    end

    context "無効な条件" do
      it ":nameがない時無効なこと" do
        fixed_cost = FactoryBot.build(:fixed_cost, name: nil)
        fixed_cost.valid?
        expect(fixed_cost.errors[:name]).to include("を入力してください")
      end

      it ":priceがない時無効なこと" do
        fixed_cost = FactoryBot.build(:fixed_cost, price: nil)
        fixed_cost.valid?
        expect(fixed_cost.errors[:price]).to include("を入力してください")
      end

      it ":scheduled_dateがない時無効なこと" do
        fixed_cost = FactoryBot.build(:fixed_cost, scheduled_date: nil)
        fixed_cost.valid?
        expect(fixed_cost.errors[:scheduled_date]).to include("を入力してください")
      end

      it ":user_idがない時無効なこと" do
        fixed_cost = FactoryBot.build(:fixed_cost, user_id: nil)
        fixed_cost.valid?
        expect(fixed_cost.errors[:user_id]).to include("を入力してください")
      end

      it ":category_idがない時無効なこと" do
        fixed_cost = FactoryBot.build(:fixed_cost, category_id: nil)
        fixed_cost.valid?
        expect(fixed_cost.errors[:category_id]).to include("を入力してください")
      end

      it ":payment_method_idがない時無効なこと" do
        fixed_cost = FactoryBot.build(:fixed_cost, payment_method_id: nil)
        fixed_cost.valid?
        expect(fixed_cost.errors[:payment_method_id]).to include("を入力してください")
      end

      it ":nameが51字の時無効なこと" do
        fixed_cost = FactoryBot.build(:fixed_cost, name: "a" * 51)
        fixed_cost.valid?
        expect(fixed_cost.errors[:name]).to include("は50文字以内で入力してください")
      end

      it ":noteが201字の時無効なこと" do
        fixed_cost = FactoryBot.build(:fixed_cost, note: "a" * 201)
        fixed_cost.valid?
        expect(fixed_cost.errors[:note]).to include("は200文字以内で入力してください")
      end

      it ":scheduled_dateが32の時無効なこと" do
        fixed_cost = FactoryBot.build(:fixed_cost, scheduled_date: 32)
        fixed_cost.valid?
        expect(fixed_cost.errors[:scheduled_date]).to include("は31以下の値にしてください")
      end
      
    end
  end
end
