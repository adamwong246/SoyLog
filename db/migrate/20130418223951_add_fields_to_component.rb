class AddFieldsToComponent < ActiveRecord::Migration
  def change
    add_column :components, :total_amount, :decimal
    add_column :components, :price, :decimal

  end
end
