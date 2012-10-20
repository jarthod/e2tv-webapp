E2tvWebapp::Application.routes.draw do

  resources :programs

  match 'search' => 'programs#search'

  root :to => 'programs#index'

end
