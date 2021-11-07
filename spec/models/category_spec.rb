require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validationチェック" do
    context "有効な条件" do
      it ":name, :big_category, :user_idがあれば有効なこと" do
        expect(FactoryBot.create(:category)).to be_valid
      end

      it ":user_idが無くても有効なこと" do
        expect(FactoryBot.create(:category, user_id: nil)).to be_valid
      end

      it ":nameが30字の時有効なこと" do
        category = FactoryBot.build(:category, name: "a" * 30)
        category.valid?
        expect(category.errors[:name]).to be_empty
      end

      it ":user_idが別であれば、:nameが同じでも有効なこと" do
        FactoryBot.create(:category, name: "example")
        category = FactoryBot.build(:category, name: "example")
        category.valid?
        expect(category.errors[:name]).to be_empty
      end
    end

    context "無効な条件" do
      it ":nameがない場合" do
        category = FactoryBot.build(:category, name: nil)
        category.valid?
        expect(category.errors[:name]).to include("を入力してください")
      end

      it ":big_categoryがない場合" do
        category = FactoryBot.build(:category, big_category: nil)
        category.valid?
        expect(category.errors[:big_category]).to include("を入力してください")
      end

      it ":nameが31字の時" do
        category = FactoryBot.build(:category, name: "a" * 31)
        category.valid?
        expect(category.errors[:name]).to include("は30文字以内で入力してください")
      end

      it "同一:user_id、同一:nameの時無効なこと" do
        FactoryBot.create(:category, name: "example", user_id: "1234")
        category = FactoryBot.build(:category, name: "example", user_id: "1234")
        category.valid?
        expect(category.errors[:name]).to include("はすでに存在します")
      end
    end
  end
end
