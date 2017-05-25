class Api::V1::CommentsController < ApplicationController

  def index
    @comments = (Comment.where article_id: params[:article_id]).includes(:user)
    render json: @comments, each_serializer: Comment::ArticleCommentSerializer
  end

  def create
    @comment = Comment.new content: params[comment][:content], user_id: current_user.id, article_id: params[:article_id]
    if @comment.save
      render json: {messages: "succsess"}, status: 200
    else
      render json: {errors: @comment.errors} , status: 401
    end
  end

  def update
    @comment = Comment.find params[:id]
    if @comment.update content: params[:comment][:content]
      render json: {messages: "succsess"}, status: 200
    else
      render json: {errors: @comment.errors} , status: 401
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    if @comment.destroy
      render json: {messages: "succsess"}, status: 200
    else
      render json: {errors: @comment.errors} , status: 401
    end
  end
end
