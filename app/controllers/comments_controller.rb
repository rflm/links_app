class CommentsController < ApplicationController
  before_action :set_link

  def create
    @comment = Comment.new(comment_params)
    @comment.link = @link
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Comment added!'
      redirect_to link_path(@link)
    else
      render 'new'
    end
  end

  private

    def set_link
      @link = Link.find(params[:link_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
