class AddDefaultValuesToOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :racked, :boolean, default: false
  	change_column :orders, :rack_number, :string, default: "add rack number"
  end
end
