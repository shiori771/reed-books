Rails.application.routes.draw do
 root to: "books#search"
 get "search", to: "books#search" 
end
