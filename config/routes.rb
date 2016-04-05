Rails.application.routes.draw do
  root "locations#index"

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :locations, only: [:index, :new, :create]

  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
    get "users/sign_in" => "devise/sessions#new"
  end

end
