class Ability
  include CanCan::Ability

  def initialize(user)

    unless user
      cannot [:new, :create, :edit], :all
      can [:index, :show], :all

    else
      can :flag, :all
      
      if user.admin?
        can :manage, :all
        can :login, :admin
      else
        can :read, :all 
        can [:edit, :update, :home], User do |u|
            u == user
        end          
        can [:full_formula, :clone, :create, :show], Recipe
        can [:edit, :update, :destroy], [Component, Recipe, Ingredient, ComponentNutrient, Flag] do |r|
            r.creator == user
        end
      end
    end
    
  end
end
