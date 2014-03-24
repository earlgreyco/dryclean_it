class AddDefaultTagNumberToOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :tag_number, :string, default: "add tag number"
  end
end
