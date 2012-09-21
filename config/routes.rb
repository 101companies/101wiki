Wiki::Application.routes.draw do
  match "101implementation:title" => "implementations#show"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
 
  devise_for :users
  resources :users, :only => [:show, :index]

  scope 'api', :format => :json do
    match "101implementation:page" => "pages#show"
  end

  #users
  match 'registrations' => 'users#index', :as => 'registrations'

  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users, :only => [:show,:destroy]

  # AUTHENTICATIONS
  match '/auth/:provider/callback' => 'authentications#create'
  resources :authentications, :only => [:index,:create,:destroy]
  match '/auth/failure' => 'authentications#auth_failure'
end
