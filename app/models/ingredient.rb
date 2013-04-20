class Ingredient < ActiveRecord::Base
  attr_accessible :amount, :component_id, :id, :recipe_id, :component_attributes, :component

  belongs_to :recipe,    :autosave => true
  belongs_to :component, :autosave => true

  accepts_nested_attributes_for :component

  def identify
    begin
      "#{self.amount.round(2)} #{self.component.units} of #{self.component.name}"
    rescue
      "Something's wrong with this record"
    end
  end

  def self.description
    "An Ingredient is the specific amount of a Component to use for a specific Recipe."
  end
end
