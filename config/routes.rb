Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
		get 'dashboards/manage_posts', to: 'dashboards#manage_posts'
		get 'dashboards/manage_users', to: 'dashboards#manage_users'

  devise_for :users

  root to: 'posts#index'
  namespace :admin do
  	resources :posts, only: [:index, :create, :new, :edit, :destroy] 
  	resources :users
  end

  resources :posts, only: [:index, :show, :update]	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
