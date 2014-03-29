class AddDryCleanOrLaunderFieldsToOrderItemsAndArticles < ActiveRecord::Migration
  def change
  	add_column :order_items, :cleaning_method, :string
  	add_column :articles, :cleaning_method, :string
  end
end
