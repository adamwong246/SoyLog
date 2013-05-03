class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    cannot :write, :all
    can :flag, :all

    # read
    # write
    ## edit
    ## create


    if user.admin?
        can :manage, :all
        can :login, :admin
    else
        can :read, :all 
        can [:full_formula, :clone, :create], Recipe
        
        can :write, User do |u|
            u == user
        end

        can :write, Recipe do |r|
            r.user == user
        end
        can :write, Ingredient do |i|
            i.recipe.user == user
        end

        can :clone, Recipe
    end
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
