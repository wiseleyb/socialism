class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :user_id
      t.integer :subscription_id
      t.integer :product_id
      t.decimal :amount
      t.datetime :payment_date
      t.string :payment_system
      t.integer :payment_system_key

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
