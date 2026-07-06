class BeersController < ApplicationController
  def index
    @beers = Beer.includes(:brewery, :style).order(:name).page(params[:page])
  end

  def show
    @beer = Beer.includes(:brewery, :style, :hops, reviews: :user).find(params[:id])
  end

  def search
    @query = params[:q]
    @beers = Beer.includes(:brewery, :style)
    @beers = @beers.where("beers.name LIKE ?", "%#{@query}%") if @query.present?
    @beers = @beers.where(style_id: params[:style_id]) if params[:style_id].present?
    @beers = @beers.page(params[:page])
  end
end