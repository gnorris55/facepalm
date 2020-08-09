Rails.application.routes.draw do
  devise_for :users, :controllers =>  { registrations: 'registrations'}
  resources :posts
  resources :users

  post '/follow' => 'users#follow', as: "user_follow"
  get '/you_page' => 'users#you_page', as: "you_page"

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
