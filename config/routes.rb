OnyxProductionManagement::Application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    delete "/users/sign_out" => "devise/sessions#destroy"
    get    "/users/sign_in" => "devise/sessions#new"
    get    "/users/sign_up" => "devise/registrations#new"
  end
  
  resources :fittings

  resources :packaging_materials

  resources :assembly_boms

  resources :bom_events

  resources :boms

  resources :orders

  resources :products do
    member do
      get "boms"
      get "orders"
      get "assembly_boms"
    end
  end

  resources :hardwares

  resources :softwares

  resources :assemblies

  resources :packaging_requirements

  resources :register_orders

  resources :events

  resources :types

  resources :materiales_events

  resources :materiales do    
    collection do
      post "search", to: 'materiales#search_materiales'
      post "update_materiale"
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'materiales#index'

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
