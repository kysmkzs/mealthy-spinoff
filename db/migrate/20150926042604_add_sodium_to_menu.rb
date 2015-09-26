class AddSodiumToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :sodium, :float
  end
end
