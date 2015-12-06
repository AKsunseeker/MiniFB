class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(@comment.post_id)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new 
    end  
  end

  def show
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @user = @comment.user
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render :edit  
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = Post.find(comment.post_id)
    if comment.destroy 
      redirect_to post_path(post)
    else
      redirect_to comment_path(comment)      
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:opinion, :post_id, :user_id)
    end



end
