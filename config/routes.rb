SoyLog3::Application.routes.draw do

  get "welcome/index"

  resources :flags

  # RailsAdmin::Engine.routes.draw do
  get "welcome/index"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
  
  resources :component_nutrients
  
  resources :components do
    member do
      get :ocr_parse
    end
  end
  resources :ingredients
  resources :nutrients
  
  resources :recipes do
    member do
      get :recipe
      get :nutrition
      get :shopping_list
      get :full_formula
      get :full_formula_ugly

      get :clone

    end
  end

  authenticated do
    match "users/home" => "users#home"
  end

  resources :users do
    resources :supplies, except: [:show]
  end

  match '/about' => 'high_voltage/pages#show', id: 'about', as: :about
  root :to => 'high_voltage/pages#show', :id => 'home'
  
end
