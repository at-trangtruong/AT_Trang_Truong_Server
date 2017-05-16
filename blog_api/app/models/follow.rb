class Follow < ApplicationRecord
  has_one :follower_user, class_name: User.name, foreign_key: :id, primary_key: :follower_user_id
  has_one :followed_user, class_name: User.name, foreign_key: :id, primary_key: :followed_user_id
end
