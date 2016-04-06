Rails.application.routes.draw do

  resources :locations, only: [:index, :new, :create, :show]
  resources :profiles, only: [:index, :new, :create, :show, :edit, :update]

  root "locations#index"

  devise_for :users, controllers: { registrations: "users/registrations" }

  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
    get "users/sign_in" => "devise/sessions#new"
  end
end
