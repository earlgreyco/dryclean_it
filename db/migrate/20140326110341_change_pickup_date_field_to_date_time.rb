class ChangePickupDateFieldToDateTime < ActiveRecord::Migration
  def change
  	change_column :orders, :pickup_date, :datetime
  end
end
