Rails.application.routes.draw do
  root "locations#index"

  resources :profiles, only: [:index, :new, :create, :show, :edit, :update]
  resources :locations

  resources :locations do
    resources :reviews, only: [:new, :create, :show]
  end

  resources :reviews, only: [:destroy, :edit, :update]

  devise_for :users

  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
    post "users/sign_in" => "devise/sessions#create"
  end
end
