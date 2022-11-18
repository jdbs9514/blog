class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.post
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(strong_params)
    @post.author = @user

    if @post.save
      flash[:success] = 'Post saved!'
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = 'Please fill all fields'
      render :new, status: 442
    end
  end

  def strong_params
    params.require(:post).permit(:title, :text)
  end
end
