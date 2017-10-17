Rails.application.routes.draw do
  resources :articles, except: [:destroy, :update]
  root "articles#index"
end
