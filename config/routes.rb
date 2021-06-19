Rails.application.routes.draw do
  resources :applies, only: [ :new, :create, :index, :show, :destroy, :edit, :update] do
    resources :rentfiles, only: [:new, :create]
    member do
      post :share
    end
  end
  resources :rentfiles, only: [:update]
  devise_for :users
  root to: 'pages#home'
  get 'monprofil', to: 'pages#monprofil'
  get 'finalized_apply/:id', to: 'applies#finalized_apply', as:'finalized_apply'
  Rails.application.routes.draw do
  # Sidekiq Web UI, only for admins.
    require "sidekiq/web"
    # authenticate :user, ->(user) { user.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    # end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
