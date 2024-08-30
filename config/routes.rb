# config/routes.rb
Rails.application.routes.draw do
  if Rails.env == 'user'
    root 'userpage/home#user_index'
    get 'tutorial', to: 'userpage/tutorials#tutorial', as: 'tutorial'
    get 'tutorial_element/:id', to: 'userpage/tutorials#tutorial_element', as: 'tutorial_element'
    get 'setting', to: 'userpage/settings#setting', as: 'setting'
    get 'profile', to: 'userpage/profiles#profile', as: 'profile'
    get 'option', to: 'userpage/options#option', as: 'option'
    get 'graph', to: 'userpage/graphs#graph', as: 'graph'
    get 'graphsetting', to: 'userpage/graphsettings#graphsetting', as: 'graphsetting'
    get 'info', to: 'userpage/infos#info', as: 'info'
    

    namespace :userpage do
      resources :reports, only: [:new, :create]
    end
  elsif Rails.env == 'operator'
    root 'operatorpage/home#operator_index'
    get 'show_report/:id', to: 'operatorpage/home#show_report', as: 'show_report'
    get 'manual_list', to: 'operatorpage/manual#manual_list', as: 'manual_list'
    get 'manual_element/:id', to: 'operatorpage/manual#manual_element', as: 'manual_element'
    get 'operator_profile', to: 'operatorpage/profile#operator_profile', as: 'operator_profile'
    get 'report_history_list', to: 'operatorpage/history#report_history_list', as: 'report_history_list'
    namespace :operatorpage do
      resources :reports, only: [:show, :update] # Rotte per la parte operator
    end
  end  
end
