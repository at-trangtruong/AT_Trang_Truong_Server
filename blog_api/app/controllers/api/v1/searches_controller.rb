class Api::V1::SearchesController < ApplicationController

  def index
    search_results = Search.where("fullname like :condition || tag like :condition || category like :condition || name like :condition", condition: "%#{params[:condition]}%").includes(:article)
    articles = search_results.map{|search|
      search.article
    }
    render json: articles, status: 200
  end
end
