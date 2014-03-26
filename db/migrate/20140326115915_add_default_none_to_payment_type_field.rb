class AddDefaultNoneToPaymentTypeField < ActiveRecord::Migration
  def change
  	change_column :orders, :payment_type, :string, default: "none"
  end
end
