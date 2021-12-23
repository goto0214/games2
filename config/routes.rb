Rails.application.routes.draw do
  get 'games/index'
  get 'games/show'
  get 'games/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
