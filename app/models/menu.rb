class Menu < ActiveRecord::Base
  validates :name , length: {  maximum: 30 } , presence: true
  validates :calorie , presence: true , numericality: {only_integer: true}
  mount_uploader :image, ImageUploader
end