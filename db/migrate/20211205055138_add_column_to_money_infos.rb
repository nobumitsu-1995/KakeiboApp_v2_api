class AddColumnToMoneyInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :money_infos, :monthly_budget, :integer
  end
end
