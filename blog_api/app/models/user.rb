class User < ApplicationRecord
  has_many :comments
  has_many :articles
  has_many :favorites

  validates :email, :presence => {:message => "Vui lòng nhập tên bài viết!!!" }
  validates :first_name, :presence => {:message => "Vui lòng nhập họ!!!" }
  validates :last_name, :presence => {:message => "Vui lòng nhập tên!!!" }
  validates :password, :presence => {:message => "Vui lòng nhập password!!!" }
  validates :sex, :presence => {:message => "Vui lòng chọn giới tính!!!" }
  validates :birthday, :presence => {:message => "Vui lòng chọn ngày sinh!!!" }
  validates :email, :uniqueness => { :message => 'Email này đã đưọc sử dụng!!!'}

end
