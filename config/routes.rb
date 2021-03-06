Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'presentations#index'

  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile

  resources :presentations do
    resources :comments
    member do
      post 'ajax_like'
    end
  end
  resources :posts do
    # resources :comments
    member do
      get 'like'
    end
  end
end
