class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
    	t.string :title
      t.integer :quantity
      t.string :recipe_id

      t.timestamps
    end
    add_index :ingredients, [:recipe_id, :title]
  end
end
