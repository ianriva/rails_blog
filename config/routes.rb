Rails.application.routes.draw do
  post "post_reviews/rate", to: "post_reviews#rate", as: "rate_post"
  resources :posts
  resources :comments, only: [:create, :destroy]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"


end
