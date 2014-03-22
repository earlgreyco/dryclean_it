class DefaultUserCreditsTo0 < ActiveRecord::Migration
  def change
  	remove_column :customers, :credits, :decimal
  	add_column :customers, :credits, :decimal, default: 0
  end
end
