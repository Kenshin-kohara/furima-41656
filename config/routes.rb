Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items', to: 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
  end
end
