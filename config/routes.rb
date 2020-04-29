Rails.application.routes.draw do

  devise_for :restaurants, controllers: {
    sessions:      'restaurants/sessions',
    passwords:     'restaurants/passwords',
    registrations: 'restaurants/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admin do
  	get 'restaurant/top' => 'restaurants#top'
  	resources :menu_categories, only: [:index, :create, :edit, :update, :destroy]
  	resources :menus, only: [:index, :create, :edit, :update, :destroy, :new]
  	resources :posts
  	resources :restaurants, only: [:show, :update]
  	resources :restaurant_images
  end

  namespace :customer do
  	resources :restaurants, only: [:index, :show] do
  		resources :menu_categories, only: [:index]
  		resources :menus, only: [:index]
  		resources :restaurant_images, only: [:index, :show]
  		resources :user_post_images, only: [:new, :create, :destroy]
  	end
  	resources :users, only: [:show]
  	resources :posts, only: [:index, :show]
  	post 'follow/:id' => 'relationships#follow', as: 'follow'
  	post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  	get 'follower_index/:id' => 'relationships#follower_index', as:'follower_index'
  	get 'users/top' => 'users#top'
  end
  root to: 'tops#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
