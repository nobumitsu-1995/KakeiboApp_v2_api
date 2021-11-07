class CreateFixedCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :fixed_costs do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :scheduled_date, null: false
      t.string :note
      t.string :user_id, null: false
      t.references :category, null: false, foreign_key: true
      t.references :payment_method, null: false, foreign_key: true

      t.timestamps
    end
  end
end
