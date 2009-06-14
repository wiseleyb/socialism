class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string  :first_name
      t.string  :last_name
      t.string  :address
      t.string  :address2
      t.string  :city
      t.string  :state
      t.string  :postal_code
      t.string  :country
      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
