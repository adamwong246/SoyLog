class ComponentNutrient < ActiveRecord::Base
  attr_accessible :amount, :component_id, :id, :nutrient_id

  belongs_to :component # component_id
  belongs_to :nutrient   # nutrient_id

  def identify
    "#{self.class.to_s}::(#{self.component.identify} which provides #{self.amount} of #{self.nutrient.identify})"
  end

  def self.description
    "A ComponentNutrient is the specific breakdown of nutrients found in a store-bought Component"
  end
  
end
