class StylesController < ApplicationController
  def index
    @styles = Style.order(:name)
  end

  def show
    @style = Style.find(params[:id])
    @beers = @style.beers.includes(:brewery)
  end
end