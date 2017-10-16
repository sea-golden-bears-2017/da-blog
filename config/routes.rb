Rails.application.routes.draw do
  resources :articles, except: [:destroy, :edit, :update]
  root "articles#index"
end
