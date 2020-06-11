Rails.application.routes.draw do
  root 'physicians#index'
  resources :physicians do
    resources :appointments
  end

  resources :patients do
    resources :appointments
  end
  
end
