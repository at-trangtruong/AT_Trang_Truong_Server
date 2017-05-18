class Article::ShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :detail, :picture, :favorites_count, :favorited, :followed, :created_at, :updated_at

  belongs_to :user, serializer: User::UserArticlesSerializer
  has_many :tags
  has_many :comments, serializer:  Comment::ArticleCommentSerializer

  def favorites_count
    object.favorites.size
  end

  def favorited
    @instance_options[:favorited]
  end

  def followed
    @instance_options[:followed]
  end

end
