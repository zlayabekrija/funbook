Rails.application.routes.draw do
  get 'friends/new'
  get 'reactions/new'
  get 'comments/new'
  # get 'posts/new'
  get 'timeline', to: "posts#new"
  resource :posts
  get 'main/home'
  # devise_for :users
  root "main#home"
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
