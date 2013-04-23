class ComponentNutrient < ActiveRecord::Base
  include ComponentNutrientsHelper

  has_many :flags, as: :flagable

  belongs_to :component, autosave: true
  belongs_to :nutrient,  autosave: true

  attr_accessible :amount, :component_id, :id, :component, :nutrient, :nutrient_id

  accepts_nested_attributes_for :component
  accepts_nested_attributes_for :nutrient

  def self.description
    "A ComponentNutrient relates a store-bought Component to the Nutrients found in it. "
  end

  def self.which_joins(component, nutrient)
    ComponentNutrient.select { |cn| cn.component_id == component.id && cn.nutrient_id == nutrient.id }
  end
  
end
