Rails.application.routes.draw do
  devise_for :users
 root to: "books#search"
 get "search", to: "books#search" 
end
