class Category < ApplicationRecord
  has_many :articles

  validates :name, :presence => {:message => "Vui lòng nhập tên danh mục!!!" }
  validates :name, :uniqueness => { :message => 'Tên danh muc đã tồn tại!!!'}
end
