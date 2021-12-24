Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  resources :users, only: [:index, :edit, :show, :update]
  resources :games, only: [:index, :ahow, :create, :edit, :update, :destroy]
end
