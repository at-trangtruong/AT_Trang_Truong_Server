class Article < ApplicationRecord

  acts_as_paranoid

  mount_uploader :picture, PictureUploader

  has_many :articles_tags
  has_many :favorites
  has_many :comments
  has_one :search
  belongs_to :category
  belongs_to :user
  has_many :tags, through: :articles_tags

  validates :name, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true

  def add_tags tags
    Tag.add_tags tags.split(","), self.id
    self.create_search fullname: (self.user.first_name + " " + self.user.last_name), tag: self.get_tags, category: self.category.name, name: self.name
  end

  def get_tags
    self.tags.map{|tag| tag.name}.join(", ")
  end

end
