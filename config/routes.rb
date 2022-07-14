Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    session: 'users/sessions'
    }
  devise_scope :user do
    post 'users/sign_up/confirm', to: 'users/registrations#confirm'
    get 'users/sign_up/complete', to: 'users/registrations#complete'
  end
  resources :tags, only: [:index, :new, :edit, :create, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
