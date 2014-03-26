class ChangeStoreCreditFieldName < ActiveRecord::Migration
  def change
  	remove_column :orders, :store_credits_used, :decimal
  	add_column :orders, :credits_used, :decimal
  end
end
