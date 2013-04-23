class Component < ActiveRecord::Base
  include ComponentsHelper

  has_many :flags, as: :flagable

  has_many :ingredients,                              autosave: true         
  has_many :component_nutrients,                      autosave: true 
  has_many :nutrients, through: :component_nutrients, autosave: true

  accepts_nested_attributes_for :ingredients,         allow_destroy: true
  accepts_nested_attributes_for :component_nutrients, allow_destroy: true
  accepts_nested_attributes_for :nutrients,           allow_destroy: true

  attr_accessible :id, :name, :unit, :url, :total_amount, :price, :serving_size

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

  def self.find_all_which_provide(nutrient)
    Component.find(:all,
      conditions: ['component_nutrient.nutrients_id = ?', nutrient.id]
    )
  end


end
