Rails.application.routes.draw do
  resources :applies, only: [ :new, :create, :index, :show, :destroy, :edit, :update] do
    resources :rentfiles, only: [:new, :create]
  end
  resources :rentfiles, only: [:update]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
