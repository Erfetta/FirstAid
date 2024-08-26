Rails.application.routes.draw do

  
  resources :reports
  # Altri percorsi, se necessari

  
  if Rails.env == 'user'
    root 'userpage/home#user_index'
  elsif Rails.env == 'operator'
    root 'operatorpage/home#operator_index'
  end

end
