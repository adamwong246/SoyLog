module RecipesHelper
  def identify
    "#{self.name}"
  end

  def all_nutrients_provided
    self.ingredients.map{|ingredient| ingredient.component.component_nutrients.map{|component_nutrient| component_nutrient.nutrient}}.flatten.uniq
  end

  def all_component_nutrients_which_supply(nutrient)
    self.ingredients.map{|i| i.component.component_nutrients.select{ |cn| cn.nutrient == nutrient }}.flatten
  end

  def all_ingredients_which_supply(nutrient)
    self.ingredients.select{|i| i.component.nutrients.include?(nutrient)}.flatten
  end

  def full_cost
    self.ingredients.each.sum{|ingredient| Unit.new(ingredient.component.price)}
  end

  def cost_per_serving
    begin
      private_cost_per_serving
    rescue
      "error"
    end
  end

  def private_cost_per_serving
    begin
      self.ingredients.each.sum{|i| i.cost_per_daily_serving}
    rescue
      raise "error"
    end
  end

  def calculated_daily_serving_of(nutrient)

    begin
      return all_ingredients_which_supply(nutrient).inject(Unit(0, Unit(nutrient.fda_rda))) {|sum, i| 
        u_ss = Unit(i.component.serving_size)
        u_fda = Unit(nutrient.fda_rda)
        
        sum + u_ss.convert_to(u_fda) * i.servings

      }
    rescue
      'Incompatible units'
    end

  end

  def percent_fda_rda_of(nutrient)
    
    begin
      100 *(self.calculated_daily_serving_of(nutrient) / Unit(nutrient.fda_rda))
    rescue
      return  'Incompatible units'
    end
    # begin
    #   if a <= 0
    #     Unit.new('0')
    #   else  

    #     # puts "Unit.new(nutrient.fda_rda): #{Unit.new(nutrient.fda_rda)}"

    #     # d = self.daily_serving_of(nutrient)
    #     # puts "self.daily_serving_of(nutrient): #{d}"
    #     # puts "nutrient.fda_rda.unit: #{nutrient.fda_rda.unit}"
    #     # puts "Unit.new(self.daily_serving_of(nutrient).convert_to(nutrient.fda_rda): #{Unit.new(self.daily_serving_of(nutrient).convert_to(nutrient.fda_rda.unit))}"

    #     # d.convert_to(nutrient.fda_rda)
    #     # 100 * (Unit(self.daily_serving_of(nutrient).convert_to(nutrient.fda_rda.unit) / Unit(nutrient.fda_rda)))
    #     # Unit(self.daily_serving_of(nutrient).convert_to(nutrient.fda_rda.unit) / Unit(nutrient.fda_rda))
    #     # self.daily_serving_of(nutrient).convert_to(nutrient.fda_rda.unit) / Unit(nutrient.fda_rda)
    #     # self.daily_serving_of(nutrient).convert_to(nutrient.fda_rda.unit)
    #     u = nutrient.fda_rda.to_unit
    #     puts u
    #     d = self.daily_serving_of(nutrient).convert_to(u)
    #     puts d.inspect 
    #     d
    #   end
    # rescue
    #   Unit("0 G")
    # end
  end



end
