class AddBarcodeToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :barcode, :string
  end
end
