class AddSupplyIdToComponents < ActiveRecord::Migration
  def change
  	add_column :components, :supply_id, :integer
  end
end
