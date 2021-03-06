BuildInfo::Application.routes.draw do

  get "tinymce_assets/create"

  resources :payments do
    match :pay_for_rating, on: :collection
  end
  post '/tinymce_assets' => 'tinymce_assets#create'


  get "crawler/parse"

  resources :reester_objects do
    collection do
      get 'find'
    end
  end


  resources :agencies do
    get :agents, on: :collection
  end
  
  resources :nodes do
    post :exchange, on: :member
    post :exchange_by_node, on: :member
    post :approve, on: :member
  end



  root :to => 'pages#index'

  resources :reviews do
    post "accept" => 'reviews#accept', on: :member
  end
  
  resources :linked_accounts

  scope :cabinet do
    match 'cabinet' => "cabinet#index", as: :cabinet_index 
    match "upgrade_account" => "cabinet#upgrade_account", as: :upgrade_account
    match 'lowbalance' => "cabinet#lowbalance"
    match 'add_rating' => "cabinet#add_rating"
  end
  get "pages/index"
  get "pages/profile"
  
  scope 'robokassa' do
    match 'paid'    => 'robokassa#paid',    :as => :robokassa_paid # to handle Robokassa push request
    match 'success' => 'robokassa#success', :as => :robokassa_success # to handle Robokassa success redirect
    match 'fail'    => 'robokassa#fail',    :as => :robokassa_fail # to handle Robokassa fail redirect
  end
  
  resources :build_object_reports
  resources :articles
  resources :build_objects do
    get :invest_projects, on: :collection
    get :manage, on: :collection
    post :sold, on: :member
    get :repost, on: :member
    get :do_repost, on: :member
    post :do_repost, on: :member
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
  get 'streets/autocomplete_street_name'
  
  # resources :streets do
  #   get :autocomplete_street_name, :on => :collection
  # end

  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get 'users/activating' => 'registrations#activating'
  end
    resources :users
    resources :votes, only: [:create, :destroy]
  # devise_scope :user do
  #   get 'activating' => 'registrations#activating'
  # end
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
