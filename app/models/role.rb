class Role < Refinery::Core::BaseModel
  
  attr_accessible :title

  # TODO: This works around a bug in rails habtm with namespaces.
  # has_and_belongs_to_many :users, :join_table => ::RolesUsers.table_name
  has_many :role_users
  has_many :users, through: :role_users

  before_validation :camelize_title
  validates :title, :uniqueness => true

  def camelize_title(role_title = self.title)
    self.title = role_title.to_s.camelize
  end

  def self.[](title)
    find_or_create_by_title(title.to_s.camelize)
  end
end