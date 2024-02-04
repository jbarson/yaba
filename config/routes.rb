Rails.application.routes.draw do
  root "posts#index"

  # get "posts" => "posts#index", as: :posts
  # get "posts/:id" => "posts#show", as: :post
  resources :posts

end
