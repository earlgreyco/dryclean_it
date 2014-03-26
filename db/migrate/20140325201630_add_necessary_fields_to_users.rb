class AddNecessaryFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phone, :string
  	add_column :users, :turnaround_time, :integer

  	add_column :users, :monday, :boolean, default: false
  	add_column :users, :tuesday, :boolean, default: false
  	add_column :users, :wednesday, :boolean, default: false
  	add_column :users, :thursday, :boolean, default: false
  	add_column :users, :friday, :boolean, default: false
  	add_column :users, :saturday, :boolean, default: false
  	add_column :users, :sunday, :boolean, default: false

  	add_column :users, :monday_start_time, :time
  	add_column :users, :tuesday_start_time, :time
  	add_column :users, :wednesday_start_time, :time
  	add_column :users, :thursday_start_time, :time
  	add_column :users, :friday_start_time, :time
  	add_column :users, :saturday_start_time, :time
  	add_column :users, :sunday_start_time, :time
  	
  	add_column :users, :monday_end_time, :time
		add_column :users, :tuesday_end_time, :time
		add_column :users, :wednesday_end_time, :time
		add_column :users, :thursday_end_time, :time
		add_column :users, :friday_end_time, :time
		add_column :users, :saturday_end_time, :time
		add_column :users, :sunday_end_time, :time
  end
end
