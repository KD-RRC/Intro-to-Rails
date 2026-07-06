class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.order(:country, :name)
    @breweries = @breweries.where(country: params[:country]) if params[:country].present?
    @countries = Brewery.distinct.order(:country).pluck(:country)
  end

  def show
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers.includes(:style)
  end
end