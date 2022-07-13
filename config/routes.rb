Rails.application.routes.draw do
  get 'tag/index'
  get 'tag/new'
  get 'tag/edit'
  get 'user/edit'
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
