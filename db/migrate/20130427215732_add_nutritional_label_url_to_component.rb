class AddNutritionalLabelUrlToComponent < ActiveRecord::Migration
  def change
    add_column :components, :nutritional_label_url, :string
  end
end
