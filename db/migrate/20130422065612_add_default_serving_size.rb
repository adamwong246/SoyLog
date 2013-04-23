class AddDefaultServingSize < ActiveRecord::Migration
  def change
    add_column :components, :serving_size, :integer
  end
end
