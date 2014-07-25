Rails.application.routes.draw do
	devise_for :admins
	root 'static#landing'
	get '/choose', to: 'static#choose', as: :choose_apartment

	get '/contracts/new/:building_id', to: 'contracts#new', as: :new_contract

	get 'buildings/:id/availability/:semester_id', to: 'availability#available'

	post '/discounts', to: 'contracts#discounts', as: :discounts
	get '/discounts', to: 'contracts#discounts'

	scope :admin do
		get '/contracts', to: 'contracts#index', as: :contracts
		post '/contracts', to: 'contracts#create'
		get '/contracts/:id', to: 'contracts#show', as: :contract
		put '/contracts/:id', to: 'contracts#update'
		get '/contracts/:id/edit', to: 'contracts#edit', as: :edit_contract

		resources :buildings do
			resources :apartments, shallow: true
		end

		resources :semesters
	end

	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# You can have the root of your site routed with "root"

	# Example of regular route:
	#   get 'products/:id' => 'catalog#view'

	# Example of named route that can be invoked with purchase_url(id: product.id)
	#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

	# Example resource route (maps HTTP verbs to controller actions automatically):
	#   resources :products

	# Example resource route with options:
	#   resources :products do
	#     member do
	#       get 'short'
	#       post 'toggle'
	#     end
	#
	#     collection do
	#       get 'sold'
	#     end
	#   end

	# Example resource route with sub-resources:
	#   resources :products do
	#     resources :comments, :sales
	#     resource :seller
	#   end

	# Example resource route with more complex sub-resources:
	#   resources :products do
	#     resources :comments
	#     resources :sales do
	#       get 'recent', on: :collection
	#     end
	#   end

	# Example resource route with concerns:
	#   concern :toggleable do
	#     post 'toggle'
	#   end
	#   resources :posts, concerns: :toggleable
	#   resources :photos, concerns: :toggleable

	# Example resource route within a namespace:
	#   namespace :admin do
	#     # Directs /admin/products/* to Admin::ProductsController
	#     # (app/controllers/admin/products_controller.rb)
	#     resources :products
	#   end
end
