Rails.application.routes.draw do
  get "pages/about"
  get "styles/index"
  get "styles/show"
  get "beers/index"
  get "beers/show"
  get "beers/search"
  get "breweries/index"
  get "breweries/show"
  root "breweries#index"
  resources :breweries, only: [:index, :show]
  resources :beers, only: [:index, :show]
  resources :styles, only: [:index, :show]
  get "about", to: "pages#about"
  get "search", to: "beers#search"
end