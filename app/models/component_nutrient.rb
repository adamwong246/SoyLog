class ComponentNutrient < ActiveRecord::Base
  include ComponentNutrientsHelper

  has_many :flags, as: :flagable

  belongs_to :component, autosave: true
  belongs_to :nutrient,  autosave: true

  attr_accessible :amount, :component_id, :id, :component, :nutrient, :nutrient_id

  accepts_nested_attributes_for :component
  accepts_nested_attributes_for :nutrient

  def self.identify
    "A ComponentNutrient relates a store-bought Component to the Nutrients found in it. "
  end

  def short_identify
    "#{self.component.short_identify}, #{self.nutrient.short_identify}"
  end


  def creator
    self.component.creator
  end

  # def self.which_joins(ingredient, nutrient)
  #   # ComponentNutrient.select { |cn| (cn.component == ingredient.component) && (cn.nutrient == nutrient) }
  #   ComponentNutrient.includes([:component, :nutrient]).where('component_id' => ingredient.component.id, 
  #     'nutrient_id' => nutrient.id)
  # end
  
end
