
# Run "rake routes" to see the actual routes
Rails.application.routes.draw do
  root 'welcome#index'

  resources :teachers do
    resources :teacher_needs
  end

  get 'teacher_needs' => 'teacher_needs#index'
  patch 'teacher_teacher_needs' => 'teacher_needs#update_checked'

  # Allows a teacher to mark a teacher_need Closed or Active.  Using GET as a kludge; it is not seeing the PATCH...
  #    perhaps a JavaScript problem????
  get   'teacher_needs/:id/close', to: 'teacher_needs#close', as: 'close_teacher_need'
  #patch 'teacher_needs/:id/close', to: 'teacher_needs#close', as: 'close_teacher_need'
  get   'teacher_needs/:id/reactivate', to: 'teacher_needs#reactivate', as: 'reactivate_teacher_need'
  #patch 'teacher_needs/:id/re-activate', to: 'teacher_needs#re-activate', as: 're-activate_teacher_need'
end



  #get 'teachers' => 'teachers#index'
  #post 'teachers' => 'teachers#create'
  #get 'teachers/new' => 'teachers#new'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

