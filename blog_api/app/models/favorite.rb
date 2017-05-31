class Favorite < ApplicationRecord
  belongs_to :article
  belongs_to :user

  def count
    self.article.favorites.size
  end
end
