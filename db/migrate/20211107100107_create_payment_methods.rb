class CreatePaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_methods do |t|
      t.string :name, null: false
      t.boolean :income, default: false, null: false
      t.string :user_id

      t.timestamps
    end
  end
end
