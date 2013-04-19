# A Component is something you can purchase from a store, or online, such as protein powder.

class Component < ActiveRecord::Base

  attr_accessible :id, :name, :unit, :url, :total_amount, :price

  has_many :ingredients         # used in many recipes
  has_many :component_nutrients       # nutrient breakdown
  has_many :nutrients, through: :component_nutrients  # each of the nutrients

  def identify
    "#{self.class.to_s}::(#{self.name})"
  end

  def self.description
    "A Component is something you can purchase from a store, or online, such as protein powder."
  end
end
