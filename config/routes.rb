Rails.application.routes.draw do
  get 'login', to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  post "/sessions", to: "sessions#create"
  root to: 'oglas#index'
  
  post "/oglas/:ogla_id/prijava", to: "prijavas#create", as: "create_prijava"
  
  resources :oglas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end