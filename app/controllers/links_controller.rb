class LinksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :vote]

  def index
    @links = Link.with_comments_count.paginate(page: params[:page], per_page: 15)
  end

  def show
    @link = Link.find(params[:id])
    @comment = Comment.new
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user = current_user
    if @link.save
      flash[:success] = 'Link added!'
      redirect_to @link
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      flash[:success] = 'Link updated!'
      redirect_to @link
    else
      render 'edit'
    end
  end

  def destroy
    Link.find(params[:id]).destroy
    flash[:success] = 'Link destroyed!'
    redirect_to links_url
  end

  def vote
    value = params[:type] == 'up' ? 1 : -1
    @link = Link.find(params[:id])
    @link.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: 'Thank you for voting'
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :description, :thumbnail_url)
  end
end
