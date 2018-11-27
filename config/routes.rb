Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :players do
    resources :bookings, only: [:create]
  end
  get "/dashboard/bookings/:id", to:"bookings#show", as: "show_new_booking"
  get "/dashboard", to: "pages#dashboard"
end

