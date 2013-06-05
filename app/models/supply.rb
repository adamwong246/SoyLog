class Supply < ActiveRecord::Base

  belongs_to :user
  has_one :component

  attr_accessible :amount, :component, :component_id

  # validates_presence_of :user
  # before_validation :set_user
  # def set_user
  #   self.user = @current_user
  # end

  def self.identify
    "The amount of a Component that you own"
  end

  # # def types
  # #   [:spam, :duplicate, :inappropriate, :dangerous, :comment, :vote]
  # # end

  # def short_identify
  #   "# #{self.id}"
  # end

  def identify
    "#{self.amount} of #{self.component.short_identify}"
  end

  def creator
    self.user
  end

  def name
    self.component.name
  end



end
