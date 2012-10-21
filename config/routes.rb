E2tvWebapp::Application.routes.draw do

  resources :programs do
    collection do
      get :torrent
    end
  end

  match 'search' => 'search#index'
  match 'search/:type/:id' => 'search#show', :as => :search
  match 'player' => 'player#show', :as => :player
  match 'download' => 'programs#download', :as => :download
  match 'tvsearch' => 'programs#search', :as => :tvsearch

  root :to => 'programs#index'

end
