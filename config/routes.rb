Rails.application.routes.draw do
  resources :reviews
  resources :favorites
  resources :weekly_forecasts
  resources :resorts
  resources :snow_reports
  resources :users
   post '/login', to: 'authentication#login'

   get :search, controller: :weekly_forecasts
   get :search, controller: :resorts
   get :search, controller: :snow_reports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
