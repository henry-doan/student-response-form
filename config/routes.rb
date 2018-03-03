Rails.application.routes.draw do
  root 'students#new'

  resources :students , except: [:edit, :update, :show]
end
