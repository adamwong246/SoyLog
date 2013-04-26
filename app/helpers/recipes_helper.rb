module RecipesHelper
  def identify
    "#{self.name}"
  end

  def all_nutrients_provided
    self.ingredients.map{|ingredient| ingredient.component.component_nutrients.map{|component_nutrient| component_nutrient.nutrient}}.flatten.uniq
  end

  def full_cost
    self.ingredients.each.sum{|ingredient| Unit.new(ingredient.component.price)}
  end

  def cost_per_serving_string
    self.ingredients.each.sum{|i| i.cost_per_serving}
  end

  def amount_of(nutrient)
    self.ingredients.select{ |i| 
      i.component.nutrients.include?(nutrient)
    }.flatten.map{|i|
      i.servings * Unit.new(i.component.serving_size)
    }.sum
    # cn_s.map{|cn| Unit.new(cn.amount * cn.servings ) }.sum
  end

  def percent_fda_rda_of(nutrient)
    a = self.amount_of(nutrient)

    if a <= 0
      Unit.new('0')
    else  
      100 * (Unit.new(self.amount_of(nutrient).convert_to(nutrient.fda_rda.unit) / Unit.new(nutrient.fda_rda)))
    end

  end

  def all_component_nutrients_which_supply(nutrient)
    self.ingredients.map{|i| i.component.component_nutrients.select{ |cn| cn.nutrient == nutrient }}.flatten
  end

end
