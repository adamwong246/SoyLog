class Recipe < ActiveRecord::Base
  include RecipesHelper

  has_many :flags, as: :flagable
  belongs_to :user,      autosave: true
  has_many :ingredients, autosave: true

  attr_accessible :id, :name, :user_id, :ingredients, :description

  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :user,        allow_destroy: true

  after_initialize :init

  def self.identify
    "A Recipe is a list of Ingredients, in certain amounts, needed to make a specific Soylent mix."
  end

  def init
    self.name ||= "my awesome recipe"
  end

  def short_identify
    self.identify
  end

  def creator
    self.user
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
