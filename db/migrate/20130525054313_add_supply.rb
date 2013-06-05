class AddSupply < ActiveRecord::Migration
  def up
  	create_table :supplies do |s|
      s.string :amount
      s.integer :user_id
    end
  end

  def down
  	drop_table :supplies
  end
end
