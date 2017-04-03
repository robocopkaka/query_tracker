class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.text :description
      t.integer :assigned_to
      t.string :resolution_note
      

      t.timestamps
    end
  end
end
