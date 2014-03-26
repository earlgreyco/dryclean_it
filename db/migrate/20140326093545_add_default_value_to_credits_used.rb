class AddDefaultValueToCreditsUsed < ActiveRecord::Migration
  def change
  	change_column :orders, :credits_used, :decimal, default: 0
  end
end
