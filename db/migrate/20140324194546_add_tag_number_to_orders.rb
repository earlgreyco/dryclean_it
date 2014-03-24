class AddTagNumberToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :tag_number, :string
  	add_index :orders, :tag_number
  end
end
