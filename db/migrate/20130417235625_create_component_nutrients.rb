class CreateComponentNutrients < ActiveRecord::Migration
  def change
    create_table :component_nutrients do |t|
      t.integer :id
      t.integer :component_id
      t.integer :nutrient_id
      t.decimal :amount

      t.timestamps
    end
  end
end
