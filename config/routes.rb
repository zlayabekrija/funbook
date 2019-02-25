Rails.application.routes.draw do
  get 'main/home'
  devise_for :users
  root "main#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
