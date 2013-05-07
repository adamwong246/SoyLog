class Ability
  include CanCan::Ability

  def initialize(user)

    unless user
      cannot [:new, :create, :edit], :all
      can [:index, :show], :all

    else
      if user.admin?
          can :manage, :all
          can :login, :admin
      else
          can :read, :all 
          can [:full_formula, :clone, :create], Recipe
          
          can [:edit, :update], User do |u|
              u == user
          end

          can [:edit, :update, :destroy], [Component, Recipe] do |r|
              r.user.id == user.id
          end
          can [:edit, :update], Ingredient do |i|
              i.recipe.user == user
          end

          can :clone, Recipe

          can :home, User
          can :show, Recipe
          can [:create, :edit], [Ingredient, Component]
      end
    end
    
  end
end
