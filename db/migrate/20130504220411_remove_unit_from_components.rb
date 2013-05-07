class RemoveUnitFromComponents < ActiveRecord::Migration
  def change
    remove_columns :components, :unit
  end
end
