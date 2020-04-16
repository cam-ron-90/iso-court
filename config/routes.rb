Rails.application.routes.draw do
  get 'laws/new'
  get 'laws/create'
  get 'laws/destroy'
  get 'sentences/new'
  get 'sentences/create'
  get 'sentences/destroy'
  get 'charges/new'
  get 'charges/create'
  get 'charges/destroy'
  get 'commitments/new'
  get 'commitments/create'
  get 'commitments/destroy'
  get 'commitments/edit'
  get 'commitments/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

end
