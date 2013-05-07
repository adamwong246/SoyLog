class MakeAmountAndUnitASingleField < ActiveRecord::Migration
  def up
    remove_column :components,  :unit
    change_column :components,  :serving_size, :string
    change_column :components,  :total_amount, :string
    change_column :components,  :price,        :string

    remove_column :ingredients, :amount
    add_column    :ingredients, :servings,       :decimal

    change_column :nutrients, :fda_rda, :string
    remove_column :nutrients, :unit

    change_column :component_nutrients, :amount, :string
  end

  def down
    add_column    :components, :units,        :intger
    change_column :components, :serving_size, :intger
    change_column :components, :total_amount, :intger
    change_column :components, :price,        :intger

    add_column    :ingredients, :amount,       :intger
    remove_column :ingredients, :servings
    
    change_column :nutrients, :fda_rda, :integer
    add_column :nutrients, :unit, :string

    change_column :component_nutrients, :amount, :decimal
  end
end
