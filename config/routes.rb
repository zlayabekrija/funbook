Rails.application.routes.draw do
  get 'friends/new'
  get 'reactions/new'
  get 'comments/new'
  # get 'posts/new'
  get 'timeline', to: 'posts#timeline'
  post 'timeline', to: 'posts#create'
  resources :posts
  resources :friends
  get 'main/home'
  devise_scope :user do
    root to: "users/sessions#root"
  end
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'callbacks',

  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
