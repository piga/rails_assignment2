Rails.application.routes.draw do
  #get 'prijavas/new'
  #get 'prijavas/get'
  #get 'prijavas/create'
  root to: 'oglas#index'
  
  post "/oglas/:ogla_id/prijava", to: "prijavas#create", as: "create_prijava"
  
  resources :oglas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
