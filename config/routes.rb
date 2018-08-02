Rails.application.routes.draw do


  resources :users, except: :index do
      resources :photos
      resources :families, except: :index do
        resources :photos
        resources :people, shallow: true do
          resources :ethnicities, only: [:new, :create, :edit, :update, :destroy]
          resources :relationships, only: [:new, :create, :edit, :update, :destroy]
          resources :partnerships, only: [:new, :create, :edit, :update, :destroy]

        end
      end
  end

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
