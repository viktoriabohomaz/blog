# frozen_string_literal: true

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'dashboards/manage_posts', to: 'dashboards#manage_posts'
  get 'dashboards/manage_users', to: 'dashboards#manage_users'

  devise_for :users

  root to: 'posts#index'
  namespace :admin do
    resources :posts, only: %i[index create new edit destroy]
    resources :users
  end

  resources :posts, only: %i[index show update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
