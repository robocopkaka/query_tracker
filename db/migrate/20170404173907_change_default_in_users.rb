class ChangeDefaultInUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :role, :role, index: true, default: "regular"
  end
end
