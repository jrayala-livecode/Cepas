Rails.application.routes.draw do
  resources :magazines
  resources :enologists
  devise_for :users
  resources :scores
end
