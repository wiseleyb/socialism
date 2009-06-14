class CreateSubscriptionLogs < ActiveRecord::Migration
  def self.up
    create_table :subscription_logs do |t|
      t.integer :subscription_key
      t.integer :user_id
      t.integer :product_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :failed_payment_attempts
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_logs
  end
end
