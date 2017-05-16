class User < ApplicationRecord
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
  validates :auth_token, uniqueness: true

  def logged_in?
    !self.nil? && self.check_auth_token
  end

  def check_auth_token
    time_create = Time.parse(self.auth_token.split("/")[1])
    Time.now - time_create < 7200
  end
end
