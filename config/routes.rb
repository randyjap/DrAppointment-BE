Rails.application.routes.draw do

  root to: 'static_pages#root'

  namespace :api, defaults: { format: :json } do
    post 'users', to: 'users#create'
    get 'doctor_search', to: 'doctors#search'
    get 'favorite_doctors', to: 'doctors#favorites'
    get 'doctor/:id', to: 'doctors#show'
  end
end
