Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs do
    resources :applications
  end

  resources :pages
  root 'jobs#index'
end
