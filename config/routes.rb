# frozen_string_literal: true
Rails.application.routes.draw do
  resources :organization_members
  resources :organizations, controller: 'domain/controllers/organizations' do
    resources :groups, controller: 'domain/controllers/groups'
  end
  get 'static/home'
  root to: 'static#home'
  get 'users/search', to: 'accounts/controllers/users#search'

  devise_for :users, class_name: 'Accounts::Models::User', controllers: { sessions: 'accounts/controllers/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
