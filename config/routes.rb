SoyLog3::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  
  resources :component_nutrients
  resources :components
  resources :ingredients
  resources :nutrients
  resources :recipes
  resources :users

  match '/about' => 'high_voltage/pages#show', id: 'about', as: :about
  root :to => 'high_voltage/pages#show', :id => 'home'
  
end
