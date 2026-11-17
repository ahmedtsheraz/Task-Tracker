Rails.application.routes.draw do
  resources :tasks do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :users do
    collection do
      post :switch
    end

    member do
      get :tasks
    end
  end
end