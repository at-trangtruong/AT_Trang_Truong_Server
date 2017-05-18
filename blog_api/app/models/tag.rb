class Tag < ApplicationRecord
  has_many :articles_tags
  has_many :articles, through: :articles_tags

  validates :name, uniqueness: true, presence: true

  def self.add_tags tags, article_id
    tags.each do |t|
      tag = self.new name: t
      if tag.save
        tag.articles_tags.create article_id: article_id
      else
        tag = self.find_by name: t
        if !tag.nil? &&  (tag.articles_tags.find_by article_id: article_id).nil?
          tag.articles_tags.create article_id: article_id
        end
      end
    end
  end
end
