class Api::V1::CategoriesController < ApplicationController
   def index
    @categories = Category.all
    render json: @categories
  end

  def show
    current_page = params[:page].blank? ? 1 : params[:page]
    category = Category.find params[:id]
    articles = category.articles.limit(5).offset(5*(current_page.to_i - 1)).includes(:user, :category)
    render json: articles, each_serializer: Article::IndexSerializer, current_user: current_user, meta: {articlesCount: category.articles}
  end
end
