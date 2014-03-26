class AddPickUpDateFieldToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :pickup_date, :date, default: DateTime.now + 2.days
  end
end
