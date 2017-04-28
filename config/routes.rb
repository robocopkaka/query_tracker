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

  root 'users#index'

  post 'close' => 'cases#close'

  devise_for :users
  resources :cases
  resources :users
  resources :categories

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
