class ChangeDefaultForAssignedToInCases < ActiveRecord::Migration[5.0]
  def change
  	change_column :cases, :assigned_to, :integer, default: 1
  end
end
