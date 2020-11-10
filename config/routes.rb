Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :restaurants do
      collection do
        get :top
      end

      member do
        get :chef
      end

      resources :reviews, only: [:new, :create]
    end
  # To destroy a review we don't need the RESTAURANTS_ID that is why doesn't have to be nested to RESTAURANTS.
  resources :reviews, only: [ :destroy ]
end
