Rails.application.routes.draw do

	resources :happenings

	resources :study_reservations

	get '/contracts/success'
	get '/contracts/failure'
	get '/amenities', to: 'static#amenities', as: :amenities
	get '/galleries', to: 'static#galleries', as: :gallery
	get '/apartments', to: 'static#apartments', as: :apartments
	get '/tenant', to: 'static#tenant', as: :tenant
	get 'maintenances/created', to: 'maintenances#created'
	get '/buildings/:building_id/apartments/:semester_id', to: 'ajax#beds'

	get '/renew', to: 'contracts#renew'
	get '/userPayment', to: 'contracts#userPayment'
	get '/makePayment', to: 'static#makePayment'

	devise_for :admins
	root 'landing#landing'

	get '/choose/:semester_id', to: 'static#choose', as: :choose_apartment
	get '/complex', to: 'static#complex', as: :complex

	get '/success', to: 'contracts#success', as: :success

	post '/invoice', to: 'contracts#discounts', as: :discounts
	get '/invoice', to: 'contracts#discounts'

	get '/contracts/new/:building_id/:semester_id', to: 'contracts#new', as: :new_contract
	get '/buildings/:id/availability/:semester_id', to: 'availability#available'

	scope :admin do
		resources :amenities
		resources :galleries
		resources :buildings
		resources :semesters
		resources :contract_texts
		resources :maintenances
		resources :study_rooms
		resources :apartments


		get '/contracts', to: 'contracts#index', as: :contracts
		post '/contracts', to: 'contracts#create'
		get '/contracts/:id', to: 'contracts#show', as: :contract
		put '/contracts/:id', to: 'contracts#update'
		get '/contracts/:id/edit', to: 'contracts#edit', as: :edit_contract
		delete '/contracts/:id', to: 'contracts#destroy', as: :destroy_contract

		get '/', to: 'static#dashboard', as: :dashboard
		get '/marketing-text', to: 'static#marketing_text', as: :edit_text
		post '/marketing-text', to: 'static#edit_text', as: :update_text
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
