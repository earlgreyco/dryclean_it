class AddRackedFieldToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :racked, :boolean, defalt: false
  end
end
