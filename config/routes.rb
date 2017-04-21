Rails.application.routes.draw do
  get 'categories/new'

  get 'categories/edit'

  get 'find_by_category' => 'cases#find_by_category'

  get 'cases/index'

  get 'cases/new'

  get 'cases/edit'

  get 'users/index'

  get 'users/new'

  get 'users/edit'

  post 'cases/:id' => 'cases#assign', as: 'assign'

  post 'cases/:id' => 'cases#close', as: 'close'

  post 'cases/:id' => 'cases#reopen', as: 'reopen'

  post 'resolve/:id' => 'cases#resolve'

  root 'users#index'

  devise_for :users
  resources :cases
  resources :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
