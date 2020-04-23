Rails.application.routes.draw do
  # get 'groups', to: 'groups#index'
  # get 'groups/new'
  # get 'groups/create'
  # get 'groups/destroy'
  get 'laws/new'
  get 'laws/create'
  get 'laws/destroy'
  get 'sentences/new'
  get 'sentences/create'
  get 'sentences/destroy'
  get 'charges/destroy'
  get 'commitments/new'
  get 'commitments/create'
  get 'commitments/destroy'
  get 'commitments/edit'
  get 'commitments/update'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups, except: [:edit, :update] do
    resources :charges, only: [:new, :create]
    resources :hearings, only: [:index, :show]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

end
