class Tag < ApplicationRecord
  has_many :articles_tags
  has_many :articles, through: :articles_tags

  validates :name, uniqueness: true, presence: true

  def self.add_tags tags, article_id
    tags.each do |t|
      tag = self.find_by name: t
      if tag.nil?
        tag = Tag.create name: t
        tag.articles_tags.create article_id: article_id
      else
        tag.articles_tags.create article_id: article_id if (tag.articles_tags.find_by article_id: article_id).nil?
      end
    end
  end
end
