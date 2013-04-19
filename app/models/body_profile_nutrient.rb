class BodyProfileNutrient < ActiveRecord::Base
  attr_accessible :body_profile_id, :daily_requirement, :id, :nutrient_id

  belongs_to :body_profile
  belongs_to :nutrient

  def identify
    self.id
  end

  def self.description
    "A BodyProfileNutrient is the daily required amount of a specific Nutrient for a specific BodyProfile"
  end
end
