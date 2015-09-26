class AddCarbToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :carb, :float
  end
end
