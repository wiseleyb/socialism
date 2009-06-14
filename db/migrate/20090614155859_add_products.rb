class AddProducts < ActiveRecord::Migration
  def self.up
    Product.create!(:id => 1, :name => "1 month", :description => "1 month subscription", :price => 10, :duration => 1)
    Product.create!(:id => 2, :name => "6 month", :description => "1 month subscription", :price => 50, :duration => 6)
    Product.create!(:id => 3, :name => "12 month", :description => "1 month subscription", :price => 100, :duration => 12)
  end

  def self.down
    Product.destroy_all
  end
end
