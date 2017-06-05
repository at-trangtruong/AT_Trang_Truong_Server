class Api::V1::CommentsController < ApplicationController
  before_action :get_comment, only: [:update, :destroy]
  def index
    @comments = (Comment.where article_id: params[:article_id]).includes(:user)
    render json: @comments, each_serializer: Comment::ArticleCommentSerializer
  end

  def create
    @comment = Comment.new content: params[comment][:content], user_id: current_user.id, article_id: params[:article_id]
    if @comment.save
      render json: comment, serializer: Comment::ArticleCommentSerializer, status: 200
    else
      render json: {messages: @comment.errors} , status: 401
    end
  end

  def update
    if @comment.update content: params[:comment][:content]
      render json: comment, serializer: Comment::ArticleCommentSerializer, status: 200
    else
      render json: {messages: @comment.errors} , status: 401
    end
  end

  def destroy
    if @comment.destroy
      render json: {messages: "succsess"}, status: 200
    else
      render json: {messages: @comment.errors} , status: 401
    end
  end

  private
  def get_comment
    @comment = Comment.find params[:id]
  end
end
