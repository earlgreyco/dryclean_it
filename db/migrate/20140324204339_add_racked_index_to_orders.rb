class AddRackedIndexToOrders < ActiveRecord::Migration
  def change
  	add_index :orders, :racked
  end
end
