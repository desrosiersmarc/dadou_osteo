Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :appointment_types

  resources :appointments, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'my_appointments', to: 'appointments#my_appointments'
end
