class CreateMoneyInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :money_infos do |t|
      t.integer :total_assets, null: false
      t.integer :target_amount
      t.date :deadline
      t.string :user_id, null: false

      t.timestamps
    end
  end
end
