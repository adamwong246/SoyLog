class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|

      t.boolean :spam
      t.boolean :duplicate
      t.boolean :inapproriate
      t.boolean :dangerous
      t.integer :vote
      
      t.text    :comment

      t.belongs_to :flagable, polymorphic: true
      
      t.timestamps
    end
    add_index :flags, [:flagable_id, :flagable_type]
  end
end
