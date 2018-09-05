Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
  end

  get 'dashboard/index'

  resources :articles do
    resources :comments
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#index"

  namespace :admin do
    get    '/'   => 'dashboard#index'
    resources :articles
  end
  
end
