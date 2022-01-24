Rails.application.routes.draw do
  root to: 'oglas#index'
  
  resources :oglas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
