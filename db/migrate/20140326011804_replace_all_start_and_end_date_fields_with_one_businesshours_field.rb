class ReplaceAllStartAndEndDateFieldsWithOneBusinesshoursField < ActiveRecord::Migration
  def change
  	remove_column :users, :monday
		remove_column :users, :tuesday
		remove_column :users, :wednesday
		remove_column :users, :thursday
		remove_column :users, :friday
		remove_column :users, :saturday
		remove_column :users, :sunday
		remove_column :users, :monday_start_time
		remove_column :users, :tuesday_start_time
		remove_column :users, :wednesday_start_time
		remove_column :users, :thursday_start_time
		remove_column :users, :friday_start_time
		remove_column :users, :saturday_start_time
		remove_column :users, :sunday_start_time
		remove_column :users, :monday_end_time
		remove_column :users, :tuesday_end_time
		remove_column :users, :wednesday_end_time
		remove_column :users, :thursday_end_time
		remove_column :users, :friday_end_time
		remove_column :users, :saturday_end_time
		remove_column :users, :sunday_end_time
		add_column :users, :business_hours, :string
  end
end