class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def up
  	execute <<-SQL
  		CREATE TYPE role AS ENUM ('regular', 'support');
  	SQL
    add_column :users, :role, :role, index: true
  end

  def down
  	remove_column :users, :role
  	execute <<-SQL
  		DROP TYPE role;
  	SQL
  end
end
