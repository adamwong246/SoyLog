module ComponentNutrientsHelper
  
  def identify
    "#{self.component.identify} and which provides #{self.component.serving_size} out of #{self.nutrient.identify} per serving"
  end
  def identify_short
    "#{self.amount} #{self.nutrient.name}"
  end

  def amount_in_this_recipe
    self.servings * self.component.amount
  end


end
