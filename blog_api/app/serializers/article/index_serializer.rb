class Article::IndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :detail, :picture, :favorites_count, :created_at, :updated_at

  belongs_to :category
  belongs_to :user, serializer: User::UserArticlesSerializer

  def favorites_count
    object.favorites.size
  end
end
