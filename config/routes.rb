# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, skip: [:sessions]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :badges, only: %i[show index]
  resources :badge_requests

  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
  
  as :user do
    get 'users/sign_in', to: 'high_voltage/pages#show', id: 'home', as: :new_user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  authenticated :user do
    root to: 'badges#index', as: :authenticated_root
  end

end
