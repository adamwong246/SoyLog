class Recipe < ActiveRecord::Base
  attr_accessible :id, :name, :user_id, :ingredients_attributes

  belongs_to :user,      :autosave => true
  has_many :ingredients, :autosave => true

  accepts_nested_attributes_for :ingredients

  validate :check_user
  def check_user
    errors.add(:user, "You can't create a Recipe as somebody beside yourself.") if check_user != user
  end

  def identify
    "#{self.name}"
  end

  def self.description
    "A Recipe describes the Ingredients needed to make a specific SoyLent mix."
  end
  
end
