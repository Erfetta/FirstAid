# config/routes.rb
Rails.application.routes.draw do
  resources :users do
    resources :reports, only: [:new, :create, :index]
  end

  resources :operators do
    resources :reports, only: [:index, :update]
  end

  root "users#index"
end
