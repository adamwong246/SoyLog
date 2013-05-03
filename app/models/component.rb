class Component < ActiveRecord::Base
  include ComponentsHelper

  has_many :flags, as: :flagable

  has_many :ingredients,                              autosave: true         
  has_many :component_nutrients,                      autosave: true 
  has_many :nutrients, through: :component_nutrients, autosave: true

  accepts_nested_attributes_for :ingredients,         allow_destroy: true
  accepts_nested_attributes_for :component_nutrients, allow_destroy: true
  accepts_nested_attributes_for :nutrients,           allow_destroy: true

  attr_accessible :id, :name, :url, :total_amount, :price, :serving_size, :nutritional_label_url

  def identify
    "#{self.name}, #{self.total_amount}"
  end

  def self.identify
    "A Component is something you can purchase from a store, or online, such as protein powder."
  end

  def self.find_all_which_provide(nutrient)
    Component.find(:all,
      conditions: ['component_nutrient.nutrients_id = ?', nutrient.id]
    )
  end


end
