ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'recipes'
  
  map.resources :users, :has_one => [:password, :confirmation]
  map.resource :session
  map.resources :passwords
  
  map.resources :recipes
end
