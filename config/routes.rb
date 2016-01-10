Rails.application.routes.draw do
  devise_for :users

  resources :topics do
    resources :bookmarks
  end

  get 'pages/index'
  get 'about' => 'pages#about'
  root 'pages#index'

end
