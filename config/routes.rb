Miditopia::Application.routes.draw do
  resources :tracks do
    resources :comments, :only => [:create, :destroy, :edit, :update]
  end
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy', :via => :delete
  root :to => 'tracks#index'
end
