Rails.application.routes.draw do

  root "static#home"
  devise_for :users
  resources :ads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
