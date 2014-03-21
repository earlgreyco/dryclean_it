class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :img
    	t.string :name
    	t.decimal :price
      t.timestamps
    end
  end
end
