class BodyProfile < ActiveRecord::Base
  attr_accessible :id, :name, :user_id

  has_many :nutrients

  def identify
    self.name
  end

  def self.description
    "A BodyProfileNutrient is the daily required amount of a specific Nutrient for a specific BodyProfile"
  end
  
end
