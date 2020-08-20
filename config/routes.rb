Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs do
    resources :applications
  end

  resources :applications
  post '/', to: 'pages#apply', as: 'apply'
  root 'pages#home'
end
