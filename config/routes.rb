Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
 root to: "books#search"
 get "search", to: "books#search" 
 resources :books, only: [:index, :new, :create, :destroy]
end
