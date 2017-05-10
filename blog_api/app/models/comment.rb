class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :name, :presence => {:message => "Vui lòng nhập nội dung comment!!!" }
end
