class ChangeIndexInCases < ActiveRecord::Migration[5.0]
  def change
  	change_column :cases, :status, :status, default: "open", index:true
  end
end
