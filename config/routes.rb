# config/routes.rb
Rails.application.routes.draw do
  if Rails.env == 'user'
    root 'userpage/home#user_index'
    namespace :userpage do
      resources :reports, only: [:new, :create]
    end
  elsif Rails.env == 'operator'
    root 'operatorpage/home#operator_index'
    namespace :operatorpage do
      resources :reports, only: [:show, :update] # Rotte per la parte operator
    end
  end  
end
