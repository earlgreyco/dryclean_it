class ChangeIngredientsQuantityColumnToString < ActiveRecord::Migration
  def change
  	remove_column :ingredients, :quantity, :integer
  	add_column :ingredients, :quantity, :string
  end
end
