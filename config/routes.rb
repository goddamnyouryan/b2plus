B2plus::Application.routes.draw do

  resources :pages

  root to: 'pages#index'
end
