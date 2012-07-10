Olearum::Application.routes.draw do
  
  resources :sesiones
  get 'login' => 'sesiones#new', :as => 'login'
  get 'logout' => 'sesiones#destroy', :as => 'logout'
  resources :email
      match "email"=> "email#new"



  resources :services
  resources :relaciones
  resources :relacions
  resources :nombre_relacions do
         get :relaciones, :on => :member

  end
  resources :generica_relacions
  resources :museo_relacions
  resources :pieza_relacions
  resources :museo_pieza_relacions
  resources :info_relacions
  resources :museo_info_relacions
  resources :hito_relacions
  resources :museo_hito_relacions
  resources :camino_relacions
  resources :museo_camino_relacions

  resources :museos do
     get :relacion, :on => :member
    resource :ficha
    resource :entorno do
        resources :hitos do
      get :relacion, :on => :member
    end
        resources :caminos do
           get :relacion, :on => :member
           resources :coordenadas
            end
        resources :urbanos
    end
    resources :espacios 
    resources :piezas do
      get :relacion, :on => :member
    end
    resources :eventos
    resources :premios
    resources :varios
      resources :medios

    resources :publicacions
    resources :infos do
      get :relacion, :on => :member
    end
    resources :servicios
  end
  
  resources :labels do
    resources :labels
  end

  resources :genericas do
         get :relacion, :on => :member

  end

  
  
  #resources :informations
  
  get "admin/index"
  get "admin/search"
  get "admin/seleccionar"

  get "olearum/index"
      match "admin"=> "inicio#index"
      match "no_compatible"=> "admin#no_compatible"
      match "no_screen"=> "admin#no_screen"

  get "resources/show"
  get "resources/detalla"
  get "resources/museostextfile"
  match "resources/hitostextfile/:id" => "resources#hitostextfile"
  match "resources/hitotextf/:id" => "resources#hitotextf"
  match "resources/hitotextfg/:id" => "resources#hitotextfg"
  match "resources/museostextfile/:id" => "resources#museostextfile"
    match "resumen/museo/:id"=> "resumen#museo"
    match "resources/medio/:id"=> "resources#medio"
    match "resources/camino/:url"=> "resources#camino"

  match 'mapa' => 'resources#show'

  get "resources/search"
  get "resources/fly"
  #get "resources/relacionables"




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'resources#show'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
