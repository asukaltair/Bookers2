Rails.application.routes.draw do



	devise_for :users
	root 'homes#top'

	get "users/:id" => "users#show", as: :mypage

	resources :users, only: [:edit, :show] do
		resources :books, only: [:create, :destroy]
	end

	resources :books, only: [:show]
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
