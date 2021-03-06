Rails.application.routes.draw do
  resources :fights
  resources :fights
  get 'static_pages/home'
  post '/fights/challenger_pokemon', to: 'fights#challenger_pokemon', as: 'challenger_pokemon'
  post '/fights/challenged_player', to: 'fights#challenged_player', as: 'challenged_player'
  post '/fights/challenged_pokemon', to: 'fights#challenged_pokemon', as: 'challenged_pokemon'
  post '/fights/create_fight', to: 'fights#create_fight', as: 'create_fight'
  get 'static_pages/standings', to: 'static_pages#standings', as: 'standings'
  get 'pokemons/select_one' => 'pokemons#select_one', :as => 'select_one'
  get 'player_pokemons/createpk' => 'player_pokemons#createpk', :as => 'createpk'

  root 'static_pages#home'
  resources :player_pokemons
  resources :pokemons
  resources :players
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
