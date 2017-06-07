class Article::PopularSerializer < ActiveModel::Serializer
  attributes :id, :name, :picture
end
