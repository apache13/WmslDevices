Rails.application.routes.draw do
  resources :enrolls
  resources :staffs
  resources :devices
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
