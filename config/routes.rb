Rails.application.routes.draw do

  devise_for :organizers
  devise_for :participants

  get '/activities/:id' => 'activities#show'

  get '/participants/:id/profile' => 'participants#profile_show', as: :participant_profile
  patch '/participants/:id/profile' => 'participants#profile_update'
  put '/participants/:id/profile' => 'participants#profile_update'

  get '/organizers/:id/profile' => 'organizers#profile_show', as: :organizer_profile
  patch '/organizers/:id/profile' => 'organizers#profile_update'
  put '/organizers/:id/profile' => 'organizers#profile_update'

  get '/organizers/:id/activities' => 'organizers#activities_index'

  get '/participants/:id/activities' => 'participants#activities_index'
  delete '/participants/:id/activities/:activity_id' => 'participants#cancel_activity', as: :cancel_activity  
  put '/participants/:id/activities/:activity_id' => 'participants#rejoin_activity', as: :rejoin_activity 


  get '/ideas' => 'ideas#index', as: :ideas
  get '/ideas/:id' => 'ideas#show', as: :idea

  get '/participants/:participant_id/ideas' => 'participants/ideas#index', as: :participant_ideas
  get '/participants/:participant_id/ideas/new' => 'participants/ideas#new', as: :new_participant_ideas
  post '/participants/:participant_id/ideas' => 'participants/ideas#create'
  get '/participants/:participant_id/ideas/:id' => 'participants/ideas#show', as: :participant_idea
  put '/participants/:participant_id/ideas/:id' => 'participants/ideas#update'
  patch '/participants/:participant_id/ideas/:id' => 'participants/ideas#update'
  delete '/participants/:participant_id/ideas/:id' => 'participants/ideas#destroy'
  get '/participants/:participant_id/ideas/:id/edit' => 'participants/ideas#edit', as: :edit_participant_idea

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
