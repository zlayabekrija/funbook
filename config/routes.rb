Rails.application.routes.draw do
  devise_scope :user do
    root to: "users/sessions#root"
  end
  get 'users/show'
  get 'friends/new'
  get 'reactions/new'
  get 'comments/new'
  get 'timeline', to: 'posts#timeline'
  post 'timeline', to: 'posts#create'
  post 'like', to: 'reactions#create'
  resources :comments
  resources :posts
  resources :friends
  get 'main/home'
 
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'callbacks',

  }
  resources :users
  #match '*path', to:'users/sessions#root', via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index'
end
