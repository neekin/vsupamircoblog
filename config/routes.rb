Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'page#welcome'

   get 'photobook'=> 'page#photobook'
   post 'createphotobook' =>'photobooks#createphotobook'
   post 'photos/uploadphoto' =>'photos#uploadphoto'
   post 'photos/photolist' =>'photos#photolist'
   post 'photos/showphoto' =>'photos#showphoto'

  #user
   get 'signup' => 'users#signup' , :as =>'signup'
   get 'login'=> 'users#login', :as =>'login'
   post 'create_login_session' => 'users#create_login_session'
   get 'logout' =>'users#logout', :as =>'logout'
   post 'avatar/uploadavatar'=>'users#avatar'
   resources :users,only:[:create]
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
