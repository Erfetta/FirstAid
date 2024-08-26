Rails.application.routes.draw do

  
  resources :reports
  # Altri percorsi, se necessari
  get 'operator/index', to: 'operatorpage/home#operator_index', as: 'operator_index'

  resources :reports, only: [:show, :update] 
  
  if Rails.env == 'user'
    root 'userpage/home#user_index'
  elsif Rails.env == 'operator'
    root 'operatorpage/home#operator_index'
  end

end
