Krasivo::Application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'

  match 'subscriptions/subscribe' => 'subscriptions#subscribe'

  namespace :b2b do
    match 'food' => 'b2b#food'
    match 'portfolio' => 'b2b#portfolio'
    match 'catering' => 'b2b#catering'
    match 'price' => 'b2b#price'
    match 'contacts' => 'b2b#contacts'
  end

  resources :line_items
  resources :events
  resources :carts
  resources :appointments
  resources :recipes
  resources :orders

  devise_for :users, :controllers => { sessions: 'sessions' }

  get "orders/create"

  
  # Vacancies
  match 'vacancies/:id' => 'vacancies#show', :as => :vacancy
  match 'vacancy' => 'vacancies#index', :as => :vacancies
  
  # Events
  match 'events/:id' => 'events#show', :as => :event
  match 'future' => 'events#future', :as => :future_events
  match 'past' => 'events#past', :as => :past_events
  match 'courses' => 'events#courses', :as => :courses
  
  # Blog
  match 'blog' => 'articles#index', :as => :blog
  match 'blog/:id' => 'articles#show', :as => :article
  match '/blog_feed' => 'articles#feed',
        :as => :blog_feed,
        :defaults => { :format => 'atom' }
        
  match '/events_feed' => 'events#feed',
        :as => :events_feed,
        :defaults => { :format => 'atom' }
  
  # Static Pages
  match '/contacts' => 'static_pages#contacts'
  match '/school' => 'static_pages#school'
  match '/services' => 'static_pages#services'

  root :to => 'static_pages#home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  match '/:id' => 'pages#show', :as => :page

end