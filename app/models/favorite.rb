class Favorite < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :menu, class_name: "Menu"
end
