class RoleUser < Refinery::Core::BaseModel
  belongs_to :role
  belongs_to :user

  # after_create :set_created_at
  def set_created_at
    self.created_at = Time.now
  end
end