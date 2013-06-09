B2plus::Application.routes.draw do
  resources :team, except: [:show, :index]
  resources :work, except: [:show, :index]
  resources :home, only: [:edit, :update]
  get '/admin', to: 'pages#admin'
  post '/contact', to: 'pages#contact'
  resources :pages, only: [:index, :admin, :contact]

  root to: 'pages#index'
end
