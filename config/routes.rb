Rails.application.routes.draw do

  devise_for :users
  root "tasks#index"

  resources :tasks do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :users do

    member do
      get :tasks
    end
  end
end