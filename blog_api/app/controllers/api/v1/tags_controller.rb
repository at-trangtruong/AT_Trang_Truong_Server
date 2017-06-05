class Api::V1::TagsController < ApplicationController

  def index
    tags = Tag.joins(:articles).group(:tag_id).select("count(article_id) as order_item, tags.*").order('order_item desc').limit(5)
    render json: tags, each_serializer: Tag::IndexSerializer, status: 200
  end
end

