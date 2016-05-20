Rails.application.routes.draw do
  root 'home#index'

  resources :categories do
    resources :posts
  end
  
  resources :posts do
    get 'list_my', on: :collection
    resources :comments
  end

  devise_for :users
end
