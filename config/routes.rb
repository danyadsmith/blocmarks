Rails.application.routes.draw do
  devise_for :users

  get 'pages/index'
  get 'about' => 'pages#about'
  root 'pages#index'

end
