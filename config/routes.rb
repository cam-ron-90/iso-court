Rails.application.routes.draw do
  # get 'user_charge/update'
  # get 'groups', to: 'groups#index'
  # get 'groups/new'
  # get 'groups/create'
  # get 'groups/destroy'
  # get 'laws/new'
  # get 'laws/create'
  # get 'laws/destroy'
  # get 'sentences/new'
  # post 'sentences/create'
  get 'sentences/destroy'
  get 'charges/destroy'
  # get 'commitments/new'
  # get 'commitments/create'
  get 'commitments/destroy'
  get 'commitments/edit'
  get 'commitments/update'

  resources :sentences, only: [:new, :create]

  resources :user_charge, only: [:update]

  devise_for :users
  root to: 'groups#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups, except: [:edit, :update] do
    resources :commitments, only: [:new, :create]
    resources :charges, only: [:new, :create]
    resources :hearings, only: [:index, :show, :new, :create]
    resources :laws, only: [:create, :destroy]
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index ]
    end
  end

end
