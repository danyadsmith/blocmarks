Rails.application.routes.draw do
  devise_for :users

  resources :topics do
    resources :bookmarks
  end
  post :incoming, to: 'incoming#create'
  get 'pages/index'
  get 'about' => 'pages#about'
  root 'pages#index'

end
