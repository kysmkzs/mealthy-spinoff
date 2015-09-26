class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.float :calorie
      t.string :image

      t.timestamps null: false
      t.index :created_at
    end
  end
end
