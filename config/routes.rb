# config/routes.rb
Rails.application.routes.draw do
  devise_for :supervisors
  devise_for :operators
  devise_for :users, controllers: { registrations: 'userpage/registrations' }
  
  if Rails.env == 'user'
    root 'userpage/home#user_index'
    get 'new', to: 'userpage/home#new', as: 'new'
    get 'tutorial', to: 'userpage/home#tutorial', as: 'tutorial'
    get 'tutorial_element/:id', to: 'userpage/home#tutorial_element', as: 'tutorial_element'
    get 'setting', to: 'userpage/settings#setting', as: 'setting'
    get 'profile', to: 'userpage/profiles#profile', as: 'profile'
    get 'option', to: 'userpage/home#option', as: 'option'
    get 'graph', to: 'userpage/profiles#graph', as: 'graph'
    get 'graphsetting', to: 'userpage/profiles#graphsetting', as: 'graphsetting'
    get 'info', to: 'userpage/profiles#info', as: 'info'
    post 'submit_pressure', to: 'measurement_data#create_pressure'
    post 'submit_bpm', to: 'measurement_data#create_bpm'
    post 'submit_oxygen', to: 'measurement_data#create_oxygen'
  
    get 'chat/:report_id', to: 'chat#index_user', as: 'chat'
   
    get '/reports/:id/exists', to: 'chat#exists'

    #definizione rotta per la pagina di attesa
    get 'waiting', to: 'userpage/waiting#index'
    get 'check_operator_assigned', to: 'userpage/waiting#check_operator_assigned'
    
    # Per devise
    get 'login', to: 'userpage/login#new', as: 'login'  # Mostra la pagina di login
    post 'login', to: 'userpage/login#create', as: 'login_create'  # Esegue il login
    delete 'logout', to: 'userpage/login#destroy', as: 'logout'  # Esegue il logout

    devise_scope :user do
    get 'registration', to: 'userpage/registrations#new', as: 'registration'
    post 'registration', to: 'userpage/registrations#create', as: 'registration_create'
    end
    # Per i report
    post 'reports', to: 'userpage/home#create', as: 'create_report'  # Rotta per la creazione del report

    namespace :userpage do
      resources :profiles, only: [:show, :edit, :update]  # Assicurati di includere `update`
    end

  elsif Rails.env == 'operator'
    root 'operatorpage/home#operator_index'
    get 'login', to: 'operatorpage/login#new', as: 'login'  # Mostra la pagina di login
    post 'login', to: 'operatorpage/login#create', as: 'login_create'  # Esegue il login
    delete 'logout', to: 'operatorpage/login#destroy', as: 'logout'  # Esegue il logout
    get 'show_report/:id', to: 'operatorpage/home#show_report', as: 'show_report'
    patch 'update_op_id/:id', to: 'operatorpage/home#update_op_id', as: 'update_op_id'
    patch 'remove_me_from_report/:id', to: 'operatorpage/home#remove_me_from_report', as: 'remove_me_from_report'
    patch 'mark_as_done/:id' , to: 'operatorpage/home#mark_as_done', as: 'mark_as_done'
    get 'manual_list', to: 'operatorpage/manual#manual_list', as: 'manual_list'
    get 'manual_element/:id', to: 'operatorpage/manual#manual_element', as: 'manual_element'
    get 'profile', to: 'operatorpage/profile#operator_profile', as: 'profile'
    get 'report_history_list', to: 'operatorpage/history#report_history_list', as: 'report_history_list'
    get 'show_report_done/:id', to: 'operatorpage/history#show_report_done', as: 'show_report_done'

    get 'chat/:report_id', to: 'chat#index_operator', as: 'chat'

    namespace :operatorpage do
      resources :reports, only: [:show, :update] # Rotte per la parte operator
    end

    post 'verify_otp', to: 'operatorpage/login#verify_otp', as: 'verify_otp'
    get 'verify_otp', to: 'operatorpage/login#verify_otp'


  elsif Rails.env == 'supervisor'
    root 'supervisorpage/home#supervisor_index'
    get 'login', to: 'supervisorpage/login#new', as: 'login'  # Mostra la pagina di login
    post 'login', to: 'supervisorpage/login#create', as: 'login_create'  # Esegue il login
    delete 'logout', to: 'supervisorpage/login#destroy', as: 'logout'  # Esegue il logout
    get 'profile', to: 'supervisorpage/profile#supervisor_profile', as: 'profile'
    get 'sup_show_op/:id', to: 'supervisorpage/home#sup_show_op', as: 'sup_show_op'
    get 'sup_show_report/:id', to: 'supervisorpage/home#sup_show_report', as: 'sup_show_report'


    namespace :supervisorpage do
      resources :reports, only: [:show, :update] # Rotte per la parte supervisor
    end
  end 

end
