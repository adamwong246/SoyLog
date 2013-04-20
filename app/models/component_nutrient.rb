class ComponentNutrient < ActiveRecord::Base
  attr_accessible :amount, :component_id, :id, :component, :nutrient, :nutrient_id

  belongs_to :component, :autosave => true
  belongs_to :nutrient,  :autosave => true

  def identify
    "#{self.component.identify} and which provides #{self.amount} of #{self.nutrient.identify}"
  end

  def self.description
    "A ComponentNutrient relates a store-bought Component to the Nutrients found in it. "
  end
  
end
