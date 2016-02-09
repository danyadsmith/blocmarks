Rails.application.routes.draw do
  devise_for :users 
  resources :users, only: :show

  resources :topics do
    resources :bookmarks do
      member do
        post 'favorite'
        post 'unfavorite'
      end
    end
  end
  
  post :incoming, to: 'incoming#create'
  get 'pages/index'
  get 'about' => 'pages#about'
  root 'pages#index'

end
