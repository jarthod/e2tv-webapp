E2tvWebapp::Application.routes.draw do

  resources :programs

  match 'search' => 'search#index'
  match 'search/:type/:id' => 'search#show', :as => :search

  root :to => 'programs#index'

end
