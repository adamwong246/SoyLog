class Nutrient < ActiveRecord::Base
  attr_accessible :id, :unit, :name, :fda_rda

  # can be found in many components
  has_many :component_nutrients
  has_many :components, through: :component_nutrients
  # can be found in many recipes
  has_many :ingredients, through: :components
  has_many :recipes, through: :ingredients
  # can be found in many body_profiles

  def identify
    "#{self.class.to_s}::(#{self.units} of #{self.name})"
  end

  def self.description
    "A Nutrient is something the human body needs in order to operate properly."
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
