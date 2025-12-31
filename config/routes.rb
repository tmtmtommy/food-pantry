Rails.application.routes.draw do
  devise_for :users
  
  # root "posts#index"
  root "home#top"

  resources :vegetables, only: [:index]
  resources :stocks, only: [:index, :new, :create, :destroy]
  resource :mypage, only: [:show]

  get "home/top"
  get "up" => "rails/health#show", as: :rails_health_check

end
