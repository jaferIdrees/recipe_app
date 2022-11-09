# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'splash#index'
  post '/recipes/add_food', to: 'recipes#add_food'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :foods
    resources :recipes do 
      resources :recipe_foods
    end
  end
  
  # Defines the root path route ("/")
  #  root "articles#index"
end
