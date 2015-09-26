class AddGlutenToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :gluten, :integer
  end
end
