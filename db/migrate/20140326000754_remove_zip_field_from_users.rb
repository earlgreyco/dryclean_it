class RemoveZipFieldFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :zip
  end
end
