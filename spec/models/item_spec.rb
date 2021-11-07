require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validationチェック" do
    context "有効な条件" do
      it ":name, :price, :date, :note, :user_id, :category_id, :payment_method_idがある時有効なこと" do
        expect(FactoryBot.create(:item)).to be_valid
      end

      it ":nameが50字の時有効なこと" do
        item = FactoryBot.build(:item, name: "a" * 50)
        item.valid?
        expect(item.errors[:name]).to be_empty
      end

      it ":noteが200字の時有効なこと" do
        item = FactoryBot.build(:item, note: "a" * 200)
        item.valid?
        expect(item.errors[:note]).to be_empty
      end

      it ":noteがnilでも有効なこと" do
        expect(FactoryBot.create(:item, note: nil)).to be_valid
      end
      
    end

    context "無効な条件" do
      it ":nameがない時無効なこと" do
        item = FactoryBot.build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it ":priceがない時無効なこと" do
        item = FactoryBot.build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it ":dateがない時無効なこと" do
        item = FactoryBot.build(:item, date: nil)
        item.valid?
        expect(item.errors[:date]).to include("を入力してください")
      end

      it ":user_idがない時無効なこと" do
        item = FactoryBot.build(:item, user_id: nil)
        item.valid?
        expect(item.errors[:user_id]).to include("を入力してください")
      end

      it ":category_idがない時無効なこと" do
        item = FactoryBot.build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category_id]).to include("を入力してください")
      end

      it ":payment_method_idがない時無効なこと" do
        item = FactoryBot.build(:item, payment_method_id: nil)
        item.valid?
        expect(item.errors[:payment_method_id]).to include("を入力してください")
      end

      it ":nameが51字の時無効なこと" do
        item = FactoryBot.build(:item, name: "a" * 51)
        item.valid?
        expect(item.errors[:name]).to include("は50文字以内で入力してください")
      end

      it ":noteが201字の時無効なこと" do
        item = FactoryBot.build(:item, note: "a" * 201)
        item.valid?
        expect(item.errors[:note]).to include("は200文字以内で入力してください")
      end
    end
  end
end
