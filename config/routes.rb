Rails.application.routes.draw do

  resources :profiles, only: [:index, :new, :create, :show, :edit, :update]
  resources :locations

  root "locations#index"

  resources :locations do
    resources :reviews, only: [:new, :create, :show]
  end

  resources :reviews, only: [:show] do
    resources :upvotes, only: [:create, :update]
    resources :downvotes, only: [:create, :update, :destroy]
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
    get "users/sign_in" => "devise/sessions#new"
  end
end
