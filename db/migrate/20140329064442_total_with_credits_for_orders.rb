class TotalWithCreditsForOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :total_with_credits, :decimal, default: 0
  end
end
