SoyLog3::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  
  resources :component_nutrients
  resources :components
  resources :ingredients
  resources :body_profiles
  resources :nutrients
  resources :body_profile_nutrients
  resources :recipes
  resources :users

  root to: 'users#index'
  
end
