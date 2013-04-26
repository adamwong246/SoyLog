module ComponentsHelper
  def number_of_servings
    self.component.serving_size/self.amount
  end

end
