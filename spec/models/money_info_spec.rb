require 'rails_helper'

RSpec.describe MoneyInfo, type: :model do
  describe "validationチェック" do
    context "有効な条件" do
      it ":total_assets, :user_id, :monthly_budget, :target_amount, :deadlineがあれば有効なこと" do
        expect(FactoryBot.create(:money_info)).to be_valid
      end
    end

    context "無効な条件" do
      it ":total_assetsがない場合無効なこと" do
        money_info = FactoryBot.build(:money_info, total_assets: nil)
        money_info.valid?
        expect(money_info.errors[:total_assets]).to include("を入力してください") 
      end

      it ":monthly_budgetが無い場合無効なこと" do
        money_info = FactoryBot.build(:money_info, monthly_budget: nil)
        money_info.valid?
        expect(money_info.errors[:monthly_budget]).to include("を入力してください") 
      end

      it ":user_idが無い場合無効なこと" do
        money_info = FactoryBot.build(:money_info, user_id: nil)
        money_info.valid?
        expect(money_info.errors[:user_id]).to include("を入力してください") 
      end

      it ":target_amountが無い場合無効なこと" do
        money_info = FactoryBot.build(:money_info, target_amount: nil)
        money_info.valid?
        expect(money_info.errors[:target_amount]).to include("を入力してください") 
      end

      it ":deadlineが無い場合無効なこと" do
        money_info = FactoryBot.build(:money_info, deadline: nil)
        money_info.valid?
        expect(money_info.errors[:deadline]).to include("を入力してください") 
      end
      
      it "同一:user_idのデータがある時作成できないこと" do
        FactoryBot.create(:money_info, user_id: "1234")
        money_info = FactoryBot.build(:money_info, user_id: "1234")
        money_info.valid?
        expect(money_info.errors[:user_id]).to include("はすでに存在します")
      end

    end
  end
end
