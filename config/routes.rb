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
end
