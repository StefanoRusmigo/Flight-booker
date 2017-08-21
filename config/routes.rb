Rails.application.routes.draw do

resources :bookings, only:[:new,:show,:create]
  root 'flights#index'


end
