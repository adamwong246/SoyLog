class Recipe < ActiveRecord::Base
  include RecipesHelper
  attr_accessible :id, :name, :user_id, :ingredients_attributes

  belongs_to :user,      :autosave => true
  has_many :ingredients, :autosave => true

  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :user, allow_destroy: true

  # validate :check_user
  # def check_user
  #   errors.add(:user, "You can't create a Recipe as somebody beside yourself.") if check_user != user
  # end

  def self.description
    "A Recipe describes the Ingredients needed to make a specific SoyLent mix."
  end


  
end
