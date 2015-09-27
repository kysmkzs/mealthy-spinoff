class AddLikefoodToUser < ActiveRecord::Migration
  def change
    add_column :users, :likefood, :string
  end
end
