Rails.application.routes.draw do
  devise_for :items
  devise_for :users
  get 'items/index'
  root 'items#index'

  resources :users, only: [:edit, :update]
  resources :items, only: [:new, :create, :destroy, :index, :show] do
    resources :messages, only: [:index, :create]

end
end