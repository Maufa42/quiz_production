Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :quizes, only: %i[index show]
  resources :responses, only: %i[create show index ]
  get '/leaderboards', to: 'responses#leaderboard'
  devise_for :users
  # devise_for :admins
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
