class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :name
    	t.string :story
    	t.string :images
    	t.integer :user_id

      t.timestamps
    end
    add_index :recipes, :user_id
  end
end
