module RecipesHelper

  def identify
    "#{self.name}"
  end 

  # def ComponentNutrient_which_joins(i, n)
  #   @component_nutrients_joins_lookup[i][n] ||= ComponentNutrient.includes([:component, :nutrient]).where('component_id' => i.component.id, 'nutrient_id' => n.id)
  # end



  # def all_component_nutrients_which_supply(nutrient)
  #   self.ingredients.map{|i| i.component.component_nutrients.select{ |cn| cn.nutrient == nutrient }}.flatten
  # end

  # def all_ingredients_which_supply(nutrient)
  #   self.ingredients.select{|i| i.component.nutrients.include?(nutrient)}.flatten.uniq
  # end

  # def full_cost
  #   self.ingredients.each.sum{|ingredient| Unit.new(ingredient.component.price)}
  # end

  # def cost_per_serving
  #   begin
  #     private_cost_per_serving
  #   rescue
  #     "error"
  #   end
  # end

  # def private_cost_per_serving
  #   begin
  #     self.ingredients.each.sum{|i| i.cost_per_daily_serving}
  #   rescue
  #     raise "error"
  #   end
  # end



  # def percent_fda_rda_of(nutrient)    
  #   begin
  #     100 *(self.calculated_daily_serving_of(nutrient) / Unit(nutrient.fda_rda))
  #   rescue
  #     return  'Incompatible units'
  #   end
  # end

end
