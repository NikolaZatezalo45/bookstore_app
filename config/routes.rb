Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'books#index'

mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
resources :genres
resources :books
resources :pages

end
