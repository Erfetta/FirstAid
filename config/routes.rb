# config/routes.rb
Rails.application.routes.draw do
  if Rails.env == 'user'
    root to: 'home#user_index'
  elsif Rails.env == 'operator'
    root to: 'home#operator_index'
  else
    root to: 'home#index'
  end
end