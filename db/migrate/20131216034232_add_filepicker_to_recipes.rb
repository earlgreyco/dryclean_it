class AddFilepickerToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :filepicker_url, :string
  end
end
