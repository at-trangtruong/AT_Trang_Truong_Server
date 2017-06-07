class Api::V1::Articles::UserArticlesController < ApplicationController

	def index
		current_page = params[:page].blank? ? 1 : params[:page]
		user = User.find params[:user_id]
		user_articles = user.articles
		articles = user_articles.limit(5).offset(5*(current_page.to_i - 1)).includes(:category, :user)
		render json: articles, each_serializer: Article::IndexSerializer, current_user: current_user, meta: {articlesCount: user_articles.size}
	end
end
