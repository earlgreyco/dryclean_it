class DefaultStarchToNone < ActiveRecord::Migration
  def change
  	remove_column :customers, :starch, :string
  	add_column :customers, :starch, :string, default: "none"
  end
end
