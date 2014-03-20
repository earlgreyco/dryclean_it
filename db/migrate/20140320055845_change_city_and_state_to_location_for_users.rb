class ChangeCityAndStateToLocationForUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :city, :string
  	remove_column :users, :state, :string
  	remove_column :users, :filepicker_url, :string
  	add_column :users, :img, :string
  	add_column :users, :location, :string
  end
end
