class Menu < ActiveRecord::Base
  validates :name , length: {  maximum: 30 } , presence: true
  validates :calorie , presence: true , numericality: {only_integer: true}
  mount_uploader :image, ImageUploader

  #お気に入りユーザーの設定
  has_many :favorites , foreign_key: "menu_id", dependent: :destroy
  has_many :users, through: :favorites

  has_many :favos, class_name: "Favo", foreign_key: "menu_id", dependent: :destroy
  has_many :favo_users , through: :favos, source: :user
  
end