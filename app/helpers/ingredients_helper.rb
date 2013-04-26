module IngredientsHelper

  def identify
    begin
      "#{self.servings} servings of #{self.component.name}"
    rescue
      "Something's wrong with this record"
    end
  end

  def ingredient_fda_percentage
    begin
      self.servings/self.measured_amount
    rescue => e
      puts e.message
    end
  end

  def measured_amount
    self.servings * Unit.new(self.component.serving_size)  
  end

  def purchase_amount_string
    "#{self.component.total_amount} #{self.component.units}"
  end

  def serving_size_string
    "#{(self.component.total_amount/self.amount).round(2)} #{self.component.units}"
  end

  def price
    self.component.price
  end

  def cost_per_serving
    # split = self.split_amounts_and_units
    (Unit.new(self.component.price)/(self.servings/self.servings)).round(2)
  end

  def component_nutrients
    self.component.component_nutrients
  end

  def number_of_servings
    self.component.number_of_servings
  end


end
