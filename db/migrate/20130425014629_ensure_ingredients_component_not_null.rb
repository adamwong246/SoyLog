class EnsureIngredientsComponentNotNull < ActiveRecord::Migration
  def change
    change_column :ingredients, :recipe_id, :integer, not_null: true
    change_column :ingredients, :component_id, :integer, not_null: true
  end
end
