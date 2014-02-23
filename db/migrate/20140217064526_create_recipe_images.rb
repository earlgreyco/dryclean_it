class CreateRecipeImages < ActiveRecord::Migration
  def change
    create_table :recipe_images do |t|
    	t.string :img
    	t.integer :recipe_id

      t.timestamps
    end

    add_index :recipe_images, :recipe_id
  end
end
