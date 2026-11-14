Rails.application.routes.draw do
  resources :tasks do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :users
end
