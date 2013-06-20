BuildInfo::Application.routes.draw do

  resources :reester_objects


  resources :agencies


  root :to => 'pages#index'

  resources :reviews do
    post "accept" => 'reviews#accept', on: :member
  end

  get "cabinet/index"
  get "cabinet/upgrade_account", as: :upgrade_account
  get "pages/index"
  get "pages/profile"
  
  resources :build_object_reports
  resources :articles
  resources :build_objects do
    get :invest_projects, on: :collection
  end
  resources :news
  resources :appartements
  resources :terms
  resources :houses
  resources :addresses

  resources :countries do
    get :autocomplete_country_name, :on => :collection
  end
  resources :regions do
    get :autocomplete_region_name, :on => :collection
  end
  resources :cities do
    get :autocomplete_city_name, :on => :collection
  end
  resources :distincts do
    get :autocomplete_distinct_name, :on => :collection
  end
  resources :streets do
    get :autocomplete_street_name, :on => :collection
  end

  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => {:registrations => "registrations"}
  ActiveAdmin.routes(self)
  
  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, at: '/forums'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
