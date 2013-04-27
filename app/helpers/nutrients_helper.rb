module NutrientsHelper

  def identify
    "#{fda_rda} of #{self.name}"
  end

  # def fda_rda_string
  #   self.fda_rda
  # end

  # def percent_fda_rda_of
  #   ((self.component_nutrients.sum{|cn| cn.amount} / self.fda_rda) * 100  ).round(2)
  # end
end
