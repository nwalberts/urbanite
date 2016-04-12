Rails.application.routes.draw do
  root "locations#index"

  resources :profiles, only: [:index, :new, :create, :show, :edit, :update]

  resources :locations do
    resources :reviews, only: [:new, :create, :show, :edit, :update]
  end

  resources :reviews, only: [:show, :edit, :update, :destroy] do
    resources :upvotes, only: [:create, :update]
    resources :downvotes, only: [:create, :update]
  end

  devise_for :users

  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
  end
end
