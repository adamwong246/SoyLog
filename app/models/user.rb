class User < ActiveRecord::Base

  has_many :flags, as: :flagable

  has_many :recipes, autosave: true
  has_many :components, autosave: true

  attr_accessible :email, :password, :password_confirmation, :remember_me, :id, :name

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def identify
    self.name if self.name
    self.email if self.email
  end

  def self.identify
    "A User represents a human being"
  end

  def admin?
    self.email == "andyadmin@email.com"
  end

  def self.awesome_icon
    'icon-user'
  end

  # def flag_it(params, member)
  #   Flag.c
  # end


  
end
