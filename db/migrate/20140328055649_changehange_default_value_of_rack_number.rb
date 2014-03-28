class ChangehangeDefaultValueOfRackNumber < ActiveRecord::Migration
  def change
  	remove_column :orders, :rack_number
  	add_column :orders, :rack_number, :string
  end
end
