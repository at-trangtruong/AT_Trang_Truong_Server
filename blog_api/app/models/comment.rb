class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :content, :presence => {:message => "Vui lòng nhập nội dung comment!!!" }
end
