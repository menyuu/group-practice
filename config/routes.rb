Rails.application.routes.draw do
  devise_for :users
  resources :tags, only: [:index, :new, :edit, :create, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
