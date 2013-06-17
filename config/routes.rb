B2plus::Application.routes.draw do
  resources :team, except: [:show, :index] do
    collection { post :sort }
  end
  resources :work, except: [:show, :index] do
    collection { post :sort }
  end
  resources :home, only: [:index, :admin, :contact, :edit, :update]
  get '/admin', to: 'home#admin'
  post '/contact', to: 'home#contact'

  root to: 'home#index'
end
