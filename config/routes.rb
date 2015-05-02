Rails.application.routes.draw do

  devise_for :organizers, controllers: { sessions: "organizers/sessions", registrations: "organizers/registrations" }
  devise_for :participants, controllers: { sessions: "participants/sessions", registrations: "participants/registrations" }
  root 'homepage#index'

  # ---------- activities ----------

  get '/activities/:id' => 'activities#show'

  # ---------- participants ----------

  get '/participants/:participant_id/profile' => 'participants/profile#show', as: :participant_profile
  patch '/participants/:participant_id/profile' => 'participants/profile#update'
  put '/participants/:participant_id/profile' => 'participants/profile#update'

  get '/participants/:participant_id/activities' => 'participants/activities#index', as: :participant_activities
  delete '/participants/:participant_id/activities/:id' => 'participants/activities#cancel', as: :participant_activity
  put '/participants/:participant_id/activities/:id' => 'participants/activities#rejoin'

  get '/participants/:participant_id/ideas' => 'participants/ideas#index', as: :participant_ideas
  post '/participants/:participant_id/ideas' => 'participants/ideas#create'
  get '/participants/:participant_id/ideas/new' => 'participants/ideas#new', as: :new_participant_ideas
  get '/participants/:participant_id/ideas/:id' => 'participants/ideas#show', as: :participant_idea
  put '/participants/:participant_id/ideas/:id' => 'participants/ideas#update'
  patch '/participants/:participant_id/ideas/:id' => 'participants/ideas#update'
  delete '/participants/:participant_id/ideas/:id' => 'participants/ideas#destroy'
  get '/participants/:participant_id/ideas/:id/edit' => 'participants/ideas#edit', as: :edit_participant_idea
  get '/participants/:participant_id/summary' => 'participants#summary'
  # ---------- organizers ----------

  get '/organizers/:organizer_id/profile' => 'organizers/profile#show', as: :organizer_profile
  patch '/organizers/:organizer_id/profile' => 'organizers/profile#update'
  put '/organizers/:organizer_id/profile' => 'organizers/profile#update'

  get '/organizers/:organizer_id/activities' => 'organizers/activities#index', as: :organizer_activities
  post '/organizers/:organizer_id/activities' => 'organizers/activities#create'
  get '/organizers/:organizer_id/activities/new' => 'organizers/activities#new', as: :new_organizer_activities

  get '/organizers/:organizer_id/activities/:activity_id' => 'organizers/activities#edit', as: :organizer_activity
  patch '/organizers/:organizer_id/activities/:activity_id' => 'organizers/activities#update'
  put '/organizers/:organizer_id/activities/:activity_id' => 'organizers/activities#update'

  # ---------- ideas ----------

  get '/ideas' => 'ideas#index', as: :ideas
  get '/ideas/:id' => 'ideas#show', as: :idea


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
end
