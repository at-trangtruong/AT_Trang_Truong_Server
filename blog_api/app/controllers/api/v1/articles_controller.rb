module Api::V1
  class ArticlesController < ApplicationController

    def index
      binding.pry
      @articles = Article.all
      render json: @articles, each_serializer: Article::IndexSerializer
    end
  end
end
