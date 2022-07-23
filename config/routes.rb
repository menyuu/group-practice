Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    session: 'users/sessions'
    }
  devise_scope :user do
    post 'users/sign_up/confirm', to: 'users/registrations#confirm'
    get 'users/sign_up/complete', to: 'users/registrations#complete'
  end
  resources :groups, only: [:index, :show, :new, :create, :update] do
    resource :group_users, only: [:create, :destroy]
    post "tags/create" => "groups#group_tag_create"
    patch "tags/update" => "groups#group_tag_update"
  end
  resources :tags, only: [:index, :edit, :create, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update] do
    post "tags/create" => "users#user_tag_create", on: :collection
    patch "tags/update" => "users#user_tag_update"
  end
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
