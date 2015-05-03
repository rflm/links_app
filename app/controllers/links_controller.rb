class LinksController < ApplicationController

  def index
    @links = Link.paginate(page: params[:page])
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
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
    params.require(:link).permit(:title, :url, :description)
  end
end
