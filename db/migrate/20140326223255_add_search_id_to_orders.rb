class AddSearchIdToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :search_id, :integer
  	add_index :orders, :search_id
  end
end