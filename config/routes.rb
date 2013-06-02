B2plus::Application.routes.draw do
  resources :team, except: :show
  resources :work, except: :show
  resources :home, only: [:edit, :update]
  get 'connect', to: 'pages#connect'
  get '/admin', to: 'pages#admin'
  post '/contact', to: 'pages#contact'
  resources :pages

  root to: 'pages#index'
end
