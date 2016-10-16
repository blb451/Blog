Rails.application.routes.draw do
  get '/' => 'home#index', as: :home
  get '/about' => 'home#about', as: :about
  resources :posts
  resources :comments
end
