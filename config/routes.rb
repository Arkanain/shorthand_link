Rails.application.routes.draw do
  resources :links, only: [:index, :create, :show]

  root 'links#index'

  get '/:id' => 'links#show'
end
