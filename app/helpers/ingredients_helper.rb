module IngredientsHelper

  def identify
    begin
      "#{self.amount.round(2)} #{self.component.units} of #{self.component.name}"
    rescue
      "Something's wrong with this record"
    end
  end



  def purchase_amount_string
    "#{self.component.total_amount} #{self.component.units}"
  end

  def serving_size_string
    "#{(self.component.total_amount/self.amount).round(2)} #{self.component.units}"
  end

  def cost_string
    "$#{self.component.price.round(2)}"
  end

  def cost_per_day_string
    "$#{(self.component.price/(self.component.total_amount/self.amount)).round(2)}"
  end

  # def combined_component_nutrients_string 
  #   raw "#{self.component.component_nutrients.map{|cn| link_to "#{cn.amount} #{cn.nutrient.units}", cn}.join('<br>')}"
  # end

  def component_nutrients
    self.component.component_nutrients
  end

end
