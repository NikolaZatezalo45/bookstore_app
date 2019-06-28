Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'books#index'

mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
resources :pages
resources :genres
resources :reviews

resources :books do
   resources :reviews
 end
 resources :users do
   resources :reviews
 end

post 'purchase', to: 'book_purchases#create'

end
