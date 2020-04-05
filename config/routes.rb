Rails.application.routes.draw do
  root 'goals#index'

  resources :goals, only: [:show, :index, :new, :create] do
    member do
      post :activate
      post :add_money
    end
  end

  mount RailsEventStore::Browser => '/res'
end
