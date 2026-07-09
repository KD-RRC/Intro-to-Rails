class BeersController < ApplicationController
  def index
    @beers = Beer.includes(:brewery, :style)
    @beers = case params[:sort]
             when "abv_desc" then @beers.order(abv: :desc)
             when "abv_asc" then @beers.order(abv: :asc)
             else @beers.order(:name)
             end
    @beers = @beers.page(params[:page])
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