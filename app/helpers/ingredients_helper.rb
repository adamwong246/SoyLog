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
    puts self.component.inspect
    puts self.servings.inspect
    puts self.component.serving_size.inspect

    Unit.new(self.component.serving_size)  * self.servings

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

  def cost_per_daily_serving
    begin
      (Unit( self.price ) / (self.number_of_servings)).round(4)
    rescue 
      return "error"
    end

  end

  def component_nutrients
    self.component.component_nutrients
  end

  def number_of_servings
    u_total_amount = Unit(self.component.total_amount)
    return u_total_amount / self.measured_amount.convert_to(u_total_amount)
  end


end
