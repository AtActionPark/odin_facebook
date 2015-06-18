Rails.application.routes.draw do
  root             'static_pages#home'

  devise_for :users
  resources :users, only: [:index, :show] do
    member do
      get :friends
      get :inviters
      post :accept_invite
    end
  end
  resources :posts, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :friend_requests, only: [:create, :destroy]

  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'

end
