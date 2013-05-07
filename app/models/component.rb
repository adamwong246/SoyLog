class Component < ActiveRecord::Base
  include ComponentsHelper

  has_many :flags, as: :flagable
      
  has_many :component_nutrients,                      autosave: true 
  has_many :nutrients, through: :component_nutrients, autosave: true
  belongs_to :user

  accepts_nested_attributes_for :component_nutrients, allow_destroy: true
  accepts_nested_attributes_for :nutrients,           allow_destroy: true

  attr_accessible :user_id, :id, :name, :url, :total_amount, :price, :serving_size, :nutritional_label_url, :component_nutrients_attributes

  validates_presence_of :component_nutrients, :name, :url, :total_amount, :price, :serving_size
  validates_format_of :url, :nutritional_label_url, :with => URI::regexp(%w(http https)), :allow_blank => true
  validate :has_valid_units
  validate :has_unique_nutrients
  
  def has_valid_units
    [:total_amount, :serving_size, :price].each { |s|
      begin
        Unit(self.send(s))
      rescue
        errors.add(s, "must be a proper unit")
      end
    }
  end

  def has_unique_nutrients
    nutrients = self.component_nutrients.map{|cn| cn.nutrient }

    unless nutrients == nutrients.uniq
      errors.add("Can't have duplicate Nutrients")
    end
  end

  def creator
    self.user 
  end

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
