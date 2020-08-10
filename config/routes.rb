Rails.application.routes.draw do
  devise_for :users, :controllers =>  { registrations: 'registrations'}
  resources :posts
  resources :users

  post '/request_follow' => 'users#request_follow', as: "request_follow"
  post '/follow' => 'users#follow', as: 'follow'
  post '/reject_friendship' => 'users#reject_friendship', as: 'reject_friendship'
  get '/you_page' => 'users#you_page', as: "you_page"
  get '/friend_page' => 'posts#friend_page', as: "friend_page"
  

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
