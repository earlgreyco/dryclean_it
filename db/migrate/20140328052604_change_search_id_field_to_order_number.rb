class ChangeSearchIdFieldToOrderNumber < ActiveRecord::Migration
  def change
  	remove_column :orders, :search_id
  	add_column :orders, :order_number, :string
  end
end
