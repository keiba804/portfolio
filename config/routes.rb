Rails.application.routes.draw do

  devise_for :restaurants, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admin do
  	get 'admin/top' => 'admins#top'
  	resources :manu_categories, only: [:index, :create, :edit, :update, :destroy]
  	resources :menus
  	resources :posts
  	resources :restaurants, only: [:show]
  	resources :restaurant_images
  end
  namespace :customer do
  	resources :restaurants, only: [:index, :show] do
  		resources :menus, only: [:index]
  		resources :posts, only: [:index, :show]
  		resources :user_post_images, only: [:new, :create, :destroy]
  	end
  	resources :users, only: [:show]
  end
  root to: 'tops#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
