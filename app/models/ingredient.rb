class Ingredient < ActiveRecord::Base
  include IngredientsHelper

  attr_accessible :amount, :component_id, :id, :recipe_id, :component_attributes, :component

  belongs_to :recipe,    :autosave => true
  belongs_to :component, :autosave => true

  accepts_nested_attributes_for :component

  def self.description
    "An Ingredient is the specific amount of a Component to use for a specific Recipe."
  end
end
