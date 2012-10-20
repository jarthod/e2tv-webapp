E2tvWebapp::Application.routes.draw do

  resources :programs

  match 'search' => 'search#index'
  match 'search/:type/:id' => 'search#show', :as => :search
  match 'player' => 'player#show'

  root :to => 'programs#index'

end
