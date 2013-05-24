B2plus::Application.routes.draw do

  resource :team, except: :show
  get 'connect', to: 'pages#connect'
  get '/team', to: 'teams#index'
  get '/admin', to: 'pages#admin'
  post '/contact', to: 'pages#contact'
  resources :pages

  root to: 'pages#index'
end
