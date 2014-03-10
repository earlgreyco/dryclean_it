class AddIndexToComments < ActiveRecord::Migration
  def change
  	add_index :comments, [:user_id, :recipe_id]
  end
end
