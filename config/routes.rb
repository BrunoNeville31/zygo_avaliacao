Rails.application.routes.draw do
  
  root 'site/dashboard#index'

  
  get '/show',to: 'site/dashboard#show'
  post '/order-exibition', to: 'site/dashboard#order'
  
  namespace :admin do    
    root "dashboard#index"
    resources :bookshelf
    resources :admin_profile, only: [:edit, :update]
  end
 
  devise_for :users
  devise_for :admins
end
