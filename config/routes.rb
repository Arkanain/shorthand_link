require 'resque/server'

Rails.application.routes.draw do
  root 'links#index'

  resources :links, only: [:index, :create, :edit, :update]
  resources :users
  resources :wallets do
    get :send_wallet
  end

  mount Resque::Server, at: '/resque'

  get '/:id', to: redirect { |path_params| Link.move_me(path_params[:id]) }
end