class CreateBodyProfiles < ActiveRecord::Migration
  def change
    create_table :body_profiles do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
