class RemoveTypeFromMenus < ActiveRecord::Migration
  def change
    remove_column :menus, :type, :integer
  end
end
