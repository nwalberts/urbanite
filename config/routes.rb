Rails.application.routes.draw do
  resources :locations, only: [:index, :new, :create, :show]
end
