class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.order(:country, :name)
    @breweries = @breweries.where(country: params[:country]) if params[:country].present?
    @countries = Brewery.group(:country).order(:country).count
    @breweries = @breweries.page(params[:page])
  end

  def show
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers.includes(:style)
  end
end