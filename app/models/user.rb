class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  mount_uploader :image, ImageUploader
  
  has_many :posts

  #フォロー、フォロワーの設定  
  has_many :following_relationships, class_name:  "Relationship",
                                     foreign_key: "follower_id",
                                     dependent:   :destroy
  has_many :following_users, through: :following_relationships, source: :followed

  has_many :follower_relationships, class_name:  "Relationship",
                                    foreign_key: "followed_id",
                                    dependent:   :destroy
  has_many :follower_users, through: :follower_relationships, source: :follower

  #お気に入りメニューの設定
  has_many :favorites , foreign_key: "user_id", dependent: :destroy
  has_many :menus, through: :favorites
  
  has_many :likes, class_name: "Favo", foreign_key: "user_id", dependent: :destroy
  has_many :like_menus , through: :likes, source: :menu

  # 他のユーザーをフォローする
  def follow(other_user)
    following_relationships.create(followed_id: other_user.id)
  end

  # フォローしているユーザーをアンフォローする
  def unfollow(other_user)
    following_relationships.find_by(followed_id: other_user.id).destroy
  end

  # あるユーザーをフォローしているかどうか？
  def following?(other_user)
    following_users.include?(other_user)
  end

  # メニューをlikeする
  def like(menu)
    likes.find_or_create_by(menu_id: menu.id)
  end

  # アイテムをunlikeする
  def unlike(menu)
    likes.find_by(menu_id: menu.id).destroy
  end

  # あるアイテムをlikeしているかどうか？
  def like?(menu)
    like_menus.include?(menu)
  end

  def feed_items
    Post.where(user_id: following_user_ids + [self.id])
  end
end
