class AddTypeToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :type, :integer
  end
end
