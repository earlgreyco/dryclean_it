class AddStoreCreditsUsedFieldToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :store_credits_used, :decimal
  end
end