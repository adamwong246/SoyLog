class Recipe < ActiveRecord::Base
  include RecipesHelper

  has_many :flags, as: :flagable
  belongs_to :user,      autosave: true
  has_many :ingredients, autosave: true

  attr_accessible :id, :name, :user_id, :ingredients

  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :user,        allow_destroy: true

  after_initialize :init

  def self.identify
    "A Recipe describes the Ingredients needed to make a specific SoyLent mix."
  end

  def init
    self.name ||= "my awesome recipe"
  end



  def clone_with_ingredients(params = {})
    new_recipe = Recipe.new(params)

    new_recipe.save
    new_recipe.ingredients = self.ingredients.map { |i|
      i.dup
    }



    new_recipe.save!
    new_recipe

  end



  
end
