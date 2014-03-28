class ChangeDefaultValueOfRackNumber < ActiveRecord::Migration
  def change
  	change_column :orders, :rack_number, :string, default:"-"
  end
end
