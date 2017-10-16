Rails.application.routes.draw do
  resources :articles, only: [:index, :show, :new]
  root "articles#index"
end
