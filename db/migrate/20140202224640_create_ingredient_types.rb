class CreateIngredientTypes < ActiveRecord::Migration
  def change
    create_table :ingredient_types do |t|
    	t.string :name
    	t.string :definition
    	t.string :link
    	t.string :img
      t.timestamps
    end
  end
end
