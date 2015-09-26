class AddLipidToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :lipid, :float
  end
end
