module Api
  class ArticlesController < ApplicationController

    def index
      @articles = Article.all
      render json: @articles, each_serializer: Article::IndexSerializer
    end
  end
end
