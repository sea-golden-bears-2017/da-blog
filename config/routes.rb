Rails.application.routes.draw do
  resources :articles, except: [:destroy]
  root "articles#index"
end
