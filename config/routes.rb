TweetsDisplayer::Application.routes.draw do

  resources :sessions

  root :to => 'sessions#index'
  
  match "/auth/:provider/callback" => "sessions#create"
  match 'auth/failure', to: redirect('/')
  match "/signout" => "sessions#destroy", :as => :signout


end
