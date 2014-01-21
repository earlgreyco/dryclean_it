class AddVisibleFieldToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :visible, :boolean, default: false
  end
end
