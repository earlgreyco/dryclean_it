class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
    	t.string :description
    	t.string :recipe_id
    	t.string :filepicker_url

      t.timestamps
    end
    add_index :steps, [:recipe_id]
  end
end
