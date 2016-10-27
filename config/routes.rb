Rails.application.routes.draw do
    root 'home#index'
    get '/about' => 'home#about', as: :about
    resources :posts do
      resources :comments
      resources :favourites, only: [:create, :destroy]
    end
    resources :users do
      get :edit, on: :collection
      patch :update, on: :collection
    end
    resources :sessions, only: [:new, :create] do
      delete :destroy, on: :collection
    end
end
