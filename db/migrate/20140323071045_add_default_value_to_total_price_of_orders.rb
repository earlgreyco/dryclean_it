class AddDefaultValueToTotalPriceOfOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :total_price, :decimal
  	add_column :orders, :total_price, :decimal, default: 0
  end
end
