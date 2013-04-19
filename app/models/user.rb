class User < ActiveRecord::Base
  attr_accessible :id, :name

  has_many :recipes

  def identify
    self.name
  end

  def self.description
    "A User is the object representing the user."
  end

end
