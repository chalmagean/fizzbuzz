Rails.application.routes.draw do
  devise_for :users
  get '/:page', to: 'numbers#index'
  get '/favorite/:number', to: 'numbers#favorite', as: :favorite
  root 'numbers#index'
end
