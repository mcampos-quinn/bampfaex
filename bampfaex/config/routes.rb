Rails.application.routes.draw do
  root to: "pages#home"
  resources :people
  resources :series
  resources :events
  resources :works
  get 'calendar' => "simple_calendar#index" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
