Rails.application.routes.draw do
  resources :people
  resources :series
  resources :events
  resources :works
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
