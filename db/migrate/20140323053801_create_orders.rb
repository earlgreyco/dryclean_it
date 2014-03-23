class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.decimal :total_price
    	t.integer :user_id
    	t.integer :customer_id
      t.timestamps
    end

    add_index :orders, [:user_id, :customer_id]
  end
end
