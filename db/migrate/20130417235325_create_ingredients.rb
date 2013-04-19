class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :id
      t.integer :recipe_id
      t.integer :component_id
      t.decimal :amount

      t.timestamps
    end
  end
end
