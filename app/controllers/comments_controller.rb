class CommentsController < ApplicationController

  def index
    @link = Link.find(params[:link_id])
    @comments = @link.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to link_comments_path
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated!"

    else
      render 'edit'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment destroyed!"
    redirect_to link_comments_path
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end