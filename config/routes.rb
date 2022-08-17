Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :nutritionists, only:[:create, :index]
  post '/login', to: 'nutritionists#login'
  get '/auto_login', to: 'nutritionists#auto_login'

end
