Rails.application.routes.draw do
  get 'likes/create'

  root             'static_pages#home'

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  resources :users, only: [:index, :show] do
    member do
      get :friends
      get :inviters
      post :accept_invite
    end
  end
  resources :posts, only: [:create, :destroy] do
    resources :likes, only: [:create]
  end
  resources :friendships, only: [:create, :destroy]
  resources :friend_requests, only: [:create, :destroy]
  resources :comments, only: [:create] do
    resources :likes, only: [:create]
  end
  resources :likes, only: [:create]

  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'

end
