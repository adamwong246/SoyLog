class AddFdaToNutrient < ActiveRecord::Migration
  def change
    add_column :nutrients, :fda_rda, :decimal
  end
end
