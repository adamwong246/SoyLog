class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :id
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
