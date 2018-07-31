Rails.application.routes.draw do
  resources :ethnicities
  resources :relationships
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
