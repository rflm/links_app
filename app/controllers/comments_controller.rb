class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: :destroy

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
    @link = Link.find(params[:link_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @link = Link.find(params[:link_id])
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated!"
      redirect_to link_comments_path
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
