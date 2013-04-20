class Nutrient < ActiveRecord::Base
  include NutrientsHelper

  attr_accessible :id, :unit, :name, :fda_rda

  has_many :component_nutrients,                         :autosave => true
  has_many :components,   through: :component_nutrients, :autosave => true
  has_many :ingredients,  through: :components,          :autosave => true
  has_many :recipes,      through: :ingredients,         :autosave => true
  
  def self.description
    "A Nutrient is the FDA recommended amount of a certain substance."
  end
  
  def units
    case self.unit
    when 'g'
      "grams"
    when 'mg'
      "milligrams"
    when 'ug'
      'micrograms'
    else
      self.unit 
    end
  end


end
