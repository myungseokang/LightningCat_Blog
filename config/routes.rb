Rails.application.routes.draw do
  Rails.application.routes.default_url_options[:host] = 'l3opold7.herokuapp.com'
  get 'welcome/readme', as: :readme

  root 'home#index'

  resources :categories do
    resources :posts
  end

  resources :posts do
    get 'archive', on: :collection
    get 'list_my', on: :collection
    resources :comments
  end

  devise_for :users
end
