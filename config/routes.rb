Rails.application.routes.draw do



	devise_for :users

	root 'homes#top'
	get "home/about" => "homes#about"

	resources :users, only: [:edit, :update, :show, :index]

	resources :books, only: [:show, :index, :create, :destroy]
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
