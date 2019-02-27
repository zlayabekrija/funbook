Rails.application.routes.draw do
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
