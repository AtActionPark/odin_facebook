Rails.application.routes.draw do
  root             'static_pages#home'

  devise_for :users
  resources :users, only: [:index, :show]
  resources :posts,          only: [:create, :destroy]

  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'

end
