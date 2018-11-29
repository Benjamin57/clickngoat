Rails.application.routes.draw do
  get '/ultimate', to: "pages#players"

  get 'users/show'
  get 'users/edit', to: "users#edit"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :players do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end
  get "dashboard/bookings/:id", to:"bookings#show", as: "show_new_booking"
  get "dashboard", to: "pages#dashboard"
  patch "dashboard/bookings/:id", to:"bookings#accept", as: "accept_new_booking"
  put "dashboard/bookings/:id", to:"bookings#decline", as: "decline_new_booking"
end

