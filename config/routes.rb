Rails.application.routes.draw do
  get 'cases/index'

  get 'cases/new'

  get 'cases/edit'

  get 'users/index'

  get 'users/new'

  get 'users/edit'

  get 'cases/assign'

  root 'users#index'

  devise_for :users
  resources :cases
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
