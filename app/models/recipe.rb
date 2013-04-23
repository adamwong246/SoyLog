class Recipe < ActiveRecord::Base
  include RecipesHelper

  has_many :flags, as: :flagable

  belongs_to :user,      autosave: true
  has_many :ingredients, autosave: true

  attr_accessible :id, :name, :user_id, :ingredients_attributes

  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :user,        allow_destroy: true

  def self.description
    "A Recipe describes the Ingredients needed to make a specific SoyLent mix."
  end


  
end
