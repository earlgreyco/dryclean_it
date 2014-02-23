class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :name
    	t.string :story
    	t.string :images
      t.float :time
    	t.integer :user_id

      t.timestamps
    end
    add_index :recipes, [:time, :user_id]
  end
end
