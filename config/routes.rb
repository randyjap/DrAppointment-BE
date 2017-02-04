Rails.application.routes.draw do

  root to: 'static_pages#root'

  namespace :api, defaults: { format: :json } do
    post 'users', to: 'users#create'
    get 'users/:id', to: 'users#show'
    get 'doctor_search', to: 'doctors#search'
    post 'doctor_search', to: 'doctors#search'
    get 'favorite_doctors', to: 'doctors#favorites'
    get 'doctors/:id', to: 'doctors#show'
    post 'session', to: 'sessions#create'
    post 'appointments', to: 'appointments#create'
    get 'appointments', to: 'appointments#index'
    delete 'appointments', to: 'appointments#destroy'
    get 'patients', to: 'patients#index'
    post 'patients', to: 'patients#create'
    delete 'patients', to: 'patients#destroy'
  end
end
