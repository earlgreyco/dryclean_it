class ChangeSearchFieldToString < ActiveRecord::Migration
  def change
  	change_column :orders, :search_id, :string
  end
end
