Rails.application.routes.draw do
  
  root 'site/dashboard#index'
  
  namespace :admin do    
    root "dashboard#index"
    resources :bookshelf
  end
 
  devise_for :users
  devise_for :admins
end
