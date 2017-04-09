class AddCategoryIdToCases < ActiveRecord::Migration[5.0]
  def change
    add_column :cases, :category_id, :integer
  end
end
