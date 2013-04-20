module RecipesHelper
  def identify
    "#{self.name}"
  end

  def all_nutrients_provided
    self.ingredients.map{|ingredient| ingredient.component.component_nutrients.map{|component_nutrient| component_nutrient.nutrient}}.flatten.uniq
  end

  def cost_string
    self.ingredients.each.sum{|ingredient| ingredient.component.price}
  end

  def cost_per_day_string
    "$ #{self.ingredients.each.sum{|ingredient| (ingredient.component.price/(ingredient.component.total_amount/ingredient.amount)).round(2)}}"
  end

  def amount_of(nutrient)
    # debugger

    self.ingredients.map{|i| i.component.component_nutrients.select{ |cn| cn.nutrient == nutrient }}.flatten.map{|cn| cn.amount }.sum#i.component.component_nutrients.select {|cn| cn.nutrient}.include?(nutrient)}#.map{ |i| i.component_nutrient}
  end

  def percent_fda_rda_of(nutrient)
    ((self.amount_of(nutrient) / nutrient.fda_rda) * 100).round(2)
  end



end
