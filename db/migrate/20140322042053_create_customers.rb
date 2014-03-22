class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :img
    	t.string :phone
    	t.string :email
    	t.string :starch
    	t.decimal :credits
    	t.text :note
      t.timestamps
    end

    add_index :customers, [:first_name, :last_name, :phone, :email]
  end
end
