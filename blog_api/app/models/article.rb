class Article < ApplicationRecord
  has_many :articles_tags
  has_many :favorites
  has_many :comments
  belongs_to :category
  belongs_to :user

  validates :name, :presence => {:message => "Vui lòng nhập tên bài viết!!!" }
  validates :description, :presence => {:message => "Vui lòng nhập mô tả bài viết!!!" }
  validates :detail, :presence => {:message => "Vui lòng nhập chi tiết bài viết!!!" }
  validates :category_id, :presence => {:message => "Vui lòng chọn danh mục bài viết!!!" }

end
