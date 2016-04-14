Rails.application.routes.draw do
  root "locations#index"

  resources :profiles, only: [:index, :new, :create, :show, :edit, :update]

  resources :users, only: [:index, :destroy]

  put 'admin/:id' => 'users#make_admin', :as => "make_admin"

  resources :locations do
    resources :reviews, only: [:new, :create, :show, :edit, :update]
  end

  resources :reviews do
    resources :votes do
      collection do
        post 'upvote'
        post 'downvote'
      end
    end
  end


  devise_for :users

  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
  end
end
