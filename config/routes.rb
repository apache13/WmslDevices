Rails.application.routes.draw do
  get 'tag/print'

  get 'overview/index'
  resources :enrolls
  resources :staffs
  resources :devices  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html   
  root :to => 'overview#index'  
end
