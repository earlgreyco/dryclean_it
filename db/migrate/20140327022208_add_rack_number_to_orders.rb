class AddRackNumberToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :rack_number, :string
  end
end