class ChangeBarcodeToBarcodeData < ActiveRecord::Migration
  def change
  	remove_column :orders, :barcode
  	add_column :orders, :barcode_data, :text
  end
end
