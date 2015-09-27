class Menu < ActiveRecord::Base
  validates :name , length: {  maximum: 30 } , presence: true
  validates :calorie , presence: true , numericality: {only_integer: true}
  mount_uploader :image, ImageUploader

  #お気に入りユーザーの設定
  has_many :liking_favorites, class_name:  "Favorite",
                              foreign_key: "user_id",
                              dependent:   :destroy
  has_many :liked_users, through: :liking_favorites, source: :user

end