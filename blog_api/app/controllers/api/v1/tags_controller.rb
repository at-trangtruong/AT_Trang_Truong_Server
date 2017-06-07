class Api::V1::TagsController < ApplicationController

  def index
    tags = Tag.joins(:articles).group(:tag_id).select("count(article_id) as order_item, tags.*").order('order_item desc').limit(10)
    render json: tags, each_serializer: Tag::IndexSerializer, status: 200
  end

  def show
    tag = Tag.find params[:id]
    current_page = params[:page].blank? ? 1 : params[:page]
    articles = tag.articles.limit(5).offset(5*(current_page.to_i - 1)).includes(:user, :category)
    render articles, each_serializer: Article::IndexSerializer, current_user: current_user, meta: {articlesCount: tag.articles.size}
  end
end

