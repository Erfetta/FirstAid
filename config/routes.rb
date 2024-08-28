# config/routes.rb
Rails.application.routes.draw do
  if Rails.env == 'user'
    namespace :userpage do
      root 'home#user_index'
      resources :reports, only: [:new, :create]
    end
  elsif Rails.env == 'operator'
    namespace :operatorpage do
      root 'home#operator_index'
      resources :reports, only: [:show, :update] # Rotte per la parte operator
    end
  end

  # Default root path if needed
  root 'userpage/home#user_index'

  
end
