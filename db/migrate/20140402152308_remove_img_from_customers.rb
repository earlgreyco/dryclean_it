class RemoveImgFromCustomers < ActiveRecord::Migration
  def change
  	remove_column :customers, :img
  end
end
