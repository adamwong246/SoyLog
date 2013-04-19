class Recipe < ActiveRecord::Base
  attr_accessible :id, :name, :user_id, :ingredients_attributes

  belongs_to :user
  has_many :ingredients

  accepts_nested_attributes_for :ingredients

  def identify
    self.class.to_s + ": " + self.name
  end

  def self.description
    "A Recipe describes the Ingredients needed to make a specific SoyLent mix."
  end
  
end
