class Ingredient < ActiveRecord::Base
  attr_accessible :amount, :component_id, :id, :recipe_id, :component_attributes, :component

  belongs_to :recipe
  belongs_to :component

  accepts_nested_attributes_for :component

  def identify
    "#{self.class.to_s}::#{self.amount.round(2)} #{self.component.unit.pluralize} of #{self.component.name}"
  end

  def self.description
    "An Ingredient is the specific amount of a Component to use for a specific Recipe."
  end
end
