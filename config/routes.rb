Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :restaurant do
  	get 'admin/top' => 'admins#top'
  	resources :categories, only: [:index, :create, :edit, :update, :destroy]
  	resources :menus
  	resources :posts
  	resources :admins, only: [:show]
  end
  namespace :customer do
  	resources :admin, only: [:index, :show] do
  		resources :menus, only: [:index]
  		resources :posts, only: [:index, :show]
  		resources :user_post_images, only: [:new, :create, :destroy]
  	end
  	resources :users, only: [:show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
