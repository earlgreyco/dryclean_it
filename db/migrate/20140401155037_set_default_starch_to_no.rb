class SetDefaultStarchToNo < ActiveRecord::Migration
  def change
  	change_column :customers, :starch, :string, default: "no"
  end
end
