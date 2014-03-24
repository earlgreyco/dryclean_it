class RemoveBarcodeFromOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :barcode_data
  end
end
