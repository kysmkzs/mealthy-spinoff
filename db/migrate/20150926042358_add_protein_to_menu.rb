class AddProteinToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :protein, :float
  end
end
