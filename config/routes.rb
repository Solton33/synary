Rails.application.routes.draw do
  devise_for :users
  root to: "scenarios#index"
  resources :scenarios do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'linke/:id' => 'likes#destroy', as: 'destroy_like'
end
