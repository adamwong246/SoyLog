# A Component is something you can purchase from a store, or online, such as protein powder.

class Component < ActiveRecord::Base

  attr_accessible :id, :name, :unit, :url, :total_amount, :price

  has_many :ingredients,                              :autosave => true         
  has_many :component_nutrients,                      :autosave => true 
  has_many :nutrients, through: :component_nutrients, :autosave => true

  def identify
    "#{self.total_amount} #{self.units} of #{self.name} which costs $#{self.price}"
  end

  def self.description
    "A Component is something you can purchase from a store, or online, such as protein powder."
  end

  def units
    case self.unit
    when 'g'
      "grams"
    when 'mg'
      "milligrams"
    when 'ug'
      'micrograms'
    when 'l'
      'liters'
    else
      self.unit 
    end
  end


end
