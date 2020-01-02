Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update]
      resources :profile, only: [:index] 
      resources :tickets, only: [:index, :create, :update]  do 
        member do
          patch 'toggle'
        end
      end
      resources :messages, only: [:index, :create]

      post '/login', to: 'auth#create'
      # get '/profile', to: 'users#profile'
    end
  end

  mount ActionCable.server => '/cable'
end
