class AddVegeToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :vege, :integer
  end
end
