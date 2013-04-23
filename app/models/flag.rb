class Flag < ActiveRecord::Base
  include FlagsHelper
  
  belongs_to :flagable, :polymorphic => true

  belongs_to :user

  attr_accessible :spam, :duplicate, :inapproriate, :dangerous, :vote, :comment

  def self.description
    "A Flag lets a User mark some object"
  end

  def types
    [:spam, :inappropriate, :dangerous, :incorrect, :comment, :vote]
  end



end
