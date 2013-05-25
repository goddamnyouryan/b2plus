B2plus::Application.routes.draw do
  resources :team, except: :show
  resources :work, except: :show
  get 'connect', to: 'pages#connect'
  get '/admin', to: 'pages#admin'
  post '/contact', to: 'pages#contact'
  resources :pages

  root to: 'pages#index'
end
