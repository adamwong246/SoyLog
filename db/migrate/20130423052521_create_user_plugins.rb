class CreateUserPlugins < ActiveRecord::Migration
  def change
    create_table :user_plugins do |t|
      t.integer :user_id
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
