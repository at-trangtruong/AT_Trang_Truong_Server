class Api::V1::SearchesController < ApplicationController

  def index
    search_results = Search.where("fullname like :condition || tag like :condition || category like :condition || name like :condition", condition: "%#{ params[:condition]}%").includes(:article)
    render json: search_results, status: 200
  end
end
