class Article::IndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :picture, :favorites_count, :favorited, :created_at, :updated_at

  belongs_to :category
  belongs_to :user, serializer: User::UserArticlesSerializer

  def favorites_count
    object.favorites.size
  end

  def description
    object.detail.slice(0..100)
  end

  def favorited
    @instance_options[:current_user].nil? ? false : (@instance_options[:current_user].check_favorited object.id)
  end
end
