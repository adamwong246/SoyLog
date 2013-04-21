class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :id, :name

  has_many :recipes, :autosave => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def identify
    self.name
  end

  def self.description
    ""
  end

  def admin?
    self.email == "andyadmin@email.com"
  end

  def self.awesome_icon
    'icon-user'
  end
end
