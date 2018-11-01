Rails.application.routes.draw do

  get 'users/home' => 'users#home'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'
  resources :users
  resources :registration

  root to: 'users#home'

  get 'static_pages/home', to: 'static_pages#home'

  resources :gossips do
  resources :comments
  end



end
