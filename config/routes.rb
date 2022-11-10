# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'splash#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :foods,:recipes
  end
  # Defines the root path route ("/")
  #  root "articles#index"
end
