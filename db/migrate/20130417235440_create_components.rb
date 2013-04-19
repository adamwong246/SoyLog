class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.integer :id
      t.string :name
      t.text :url
      t.string :unit

      t.timestamps
    end
  end
end
