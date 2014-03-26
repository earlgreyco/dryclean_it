class AddBusinessFieldsToUsersInsteadOfCustomerishFields < ActiveRecord::Migration
  def change
  	remove_column :users, :age, :integer
  	remove_column :users, :gender, :string
  	remove_column :users, :location, :string
  	add_column :users, :address, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :zip, :integer
  end
end
