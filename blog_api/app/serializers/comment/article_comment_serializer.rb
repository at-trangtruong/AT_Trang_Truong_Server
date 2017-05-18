class Comment::ArticleCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :updated_at
  belongs_to :user, serializer: User::UserArticlesSerializer
end
