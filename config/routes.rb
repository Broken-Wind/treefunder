Rails.application.routes.draw do
	resources :listings do
		resources :investments
	end
	resources :investors do
		resources :investments
	end
	root "listings#index"
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
