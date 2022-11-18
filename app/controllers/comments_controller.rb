class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comments = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    comment = Comment.new(params.require(:comment).permit(:text))
    comment.author = current_user
    comment.post_id = @post.id

    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment was succesfully created.'
          redirect_to user_post_url(@user.id, @post.id)
        else
          flash[:error] = 'Comment was not created.'
          render :new, locals: { comment: }
        end
      end
    end
  end

  def strong_params
    params.require(:comment).permit(:post, :text)
  end
end
