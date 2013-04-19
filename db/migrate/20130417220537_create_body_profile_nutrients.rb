class CreateBodyProfileNutrients < ActiveRecord::Migration
  def change
    create_table :body_profile_nutrients do |t|
      t.integer :id
      t.integer :body_profile_id
      t.integer :nutrient_id
      t.decimal :daily_requirement

      t.timestamps
    end
  end
end
