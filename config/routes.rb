Rails.application.routes.draw do
  devise_for :users

  root 'post#index'

  get '/post/new' => 'post#new'
  get '/post/edit/:id' => 'post#edit'
  post '/post/:id' => 'post#update'
  delete '/post/destroy/:id' => 'post#destroy'
  post '/post' => 'post#create'

  post '/post/:id/like' => 'likes#like_toggle'

  post '/post/:id/comment' => 'comments#create'
  delete '/post/destroy_comment/:id' => 'comments#destroy'

  resources :follows, only: [:create, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
