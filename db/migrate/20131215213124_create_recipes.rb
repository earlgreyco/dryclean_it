class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :title
    	t.text :description
    	t.string :user_id

      t.timestamps
    end
    add_index :recipes, [:user_id, :title]
  end
end
