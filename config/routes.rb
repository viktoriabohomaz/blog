Rails.application.routes.draw do
		get 'dashboards/manage_posts', to: 'dashboards#manage_posts'
		get 'dashboards/manage_users', to: 'dashboards#manage_users'

  devise_for :users

  root to: 'posts#index'
  resources :posts 
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
