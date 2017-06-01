class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  has_many :comments
  has_many :articles
  has_many :favorites
  has_many :followers, class_name: Follow.name, foreign_key: :follower_user_id
  has_many :followeds, class_name: Follow.name, foreign_key: :followed_user_id

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :first_name, presence: true, length: { in: 0..10 }
  validates :last_name, presence: true, length: { in: 0..20 }
  validates :password, presence: true, length: { in: 8..32 }
  validates :sex, presence: true
  validates :birthday, presence: true

  def check_auth_token
    Time.now - self.session_time > 7200 ? false : true
  end

  def check_followed followed_user_id
    self.followers.where("followed_user_id = #{followed_user_id}").blank? ? false : true
  end

  def check_favorited article_id
    self.favorites.where("article_id = #{article_id}").blank? ? false : true
  end

  def picture
    self.avatar.url
  end
end
