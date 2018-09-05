Rails.application.routes.draw do
	resources :searchs
	resources :cases
	root'cases#index'
end
