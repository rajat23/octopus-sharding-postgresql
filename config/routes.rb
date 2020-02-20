Rails.application.routes.draw do
  get 'booking/booking'
    resources :booking, only: [:show, :create]
end