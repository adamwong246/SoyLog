SoyLog3::Application.routes.draw do

  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"
  mount Refinery::Core::Engine, :at => '/'


  resources :flags

  devise_for :users
  
  resources :component_nutrients
  resources :components
  resources :ingredients
  resources :nutrients
  
  resources :recipes do
    member do
      get :full_formula
    end
  end

  resources :users

  match '/about' => 'high_voltage/pages#show', id: 'about', as: :about
  root :to => 'high_voltage/pages#show', :id => 'home'
  
end
