# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'
  namespace :admin do
    resources :posts, only: %i[index create new edit update destroy]
    resources :users, only: %i[index create new edit destroy]
  end

  resources :posts, only: %i[index show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
