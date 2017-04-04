class AddStatusToCases < ActiveRecord::Migration[5.0]
  def up
  	execute <<-SQL
  		CREATE TYPE status AS ENUM ('open', 'fixed', 'closed');
  	SQL
    add_column :cases, :status, :status, default: "open"
  end

  def down
  	remove_column :cases, :status
  	execute <<-SQL
  		DROP TYPE status;
  	SQL
  end
end
