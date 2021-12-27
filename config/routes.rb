Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  resources :users, only: [:index, :edit, :show, :update] do
    member do
      get :follows, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end
  resources :games, only: [:index, :show, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
end
