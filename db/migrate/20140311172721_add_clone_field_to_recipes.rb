class AddCloneFieldToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :clone, :boolean, default: false
  end
end
