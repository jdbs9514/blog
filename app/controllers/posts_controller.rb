class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.post
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comments.where(post_id: params[:id])
  end
end
