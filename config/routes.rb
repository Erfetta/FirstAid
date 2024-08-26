Rails.application.routes.draw do

  
  resources :reports
  # Altri percorsi, se necessari

  
  if Rails.env == 'user'
    root to: 'home#user_index'
  elsif Rails.env == 'operator'
    root to: 'home#operator_index'
  else
    root to: 'home#index'
  end
end
