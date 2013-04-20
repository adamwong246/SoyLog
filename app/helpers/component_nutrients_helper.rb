module ComponentNutrientsHelper
  
  def identify
    "#{self.component.identify} and which provides #{self.amount} of #{self.nutrient.identify}"
  end
  def identify_short
    "#{self.amount} #{self.nutrient.unit} #{self.nutrient.name}"
  end
end
