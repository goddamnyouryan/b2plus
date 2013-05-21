B2plus::Application.routes.draw do

  resource :team, except: :show
  get '/team', to: 'team#index'
  get '/admin', to: 'pages#admin'
  resources :pages

  root to: 'pages#index'
end
