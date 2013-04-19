Nutrient.create!({id: 1, name: 'Calcium',      unit: :g,   fda_rda: 1})
Nutrient.create!({id: 2, name: 'Potassium',    unit: :g,   fda_rda: 3.5})
Nutrient.create!({id: 3, name: 'Vitamin a',    unit: :iu,  fda_rda: 5000})
Nutrient.create!({id: 4, name: 'Biotin',       unit: :mcg, fda_rda: 300})
Nutrient.create!({id: 5, name: 'Carbohydrates',unit: :g,   fda_rda: 300})
Nutrient.create!({id: 6, name: 'Fat',          unit: :g,   fda_rda: 65})

Component.create!({id: 1, name: 'Power Whey Isolate', unit: :mg, url: "amazon.com", total_amount: 5000, price: 3.56})
Component.create!({id: 2, name: 'Potassium Gluconate', unit: :g, url: "amazon.com2", total_amount: 300, price: 15.50})
Component.create!({id: 3, name: 'Ascorbic Acid', unit: :g, url: "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", total_amount: 100, price: 5.56})
Component.create!({id: 4, name: 'Biotin (1%)', unit: :g, url: "http://purebulk.com/biotin-1-vitamin-b7-vitamin-h.html", total_amount: 100, price: 9.50})
Component.create!({id: 5, name: 'Calcium Carbonate', unit: :g, url: "http://purebulk.com/calcium-carbonate-powder-usa.html", total_amount: 100, price: 17.50})
Component.create!({id: 6, name: 'Maltodextrin', unit: :g, url: "http://store.honeyvillegrain.com/maltodextrin50lb.aspx", total_amount: 22679.60, price: 60.99})
Component.create!({id: 7, name: 'Extra Light Olive Oil', unit: :l, url: "http://www.amazon.com/Bertolli-Extra-Light-Olive-Oil/dp/B008ELNF0Y/ref=sr_1_4?ie=UTF8&qid=1365725469&sr=8-4&keywords=bertolli+extra+light+olive+oil", total_amount:1.5, price: 13.45})

ComponentNutrient.create!({id: 1, component_id: 1, nutrient_id: 1, amount: 0.9})
ComponentNutrient.create!({id: 2, component_id: 1, nutrient_id: 2, amount: 0.6})
ComponentNutrient.create!({id: 3, component_id: 2, nutrient_id: 2, amount: 3.3})
ComponentNutrient.create!({id: 4, component_id: 3, nutrient_id: 3, amount: 1.1})
ComponentNutrient.create!({id: 5, component_id: 4, nutrient_id: 4, amount: 0.1})
ComponentNutrient.create!({id: 6, component_id: 6, nutrient_id: 5, amount: 0.1})
ComponentNutrient.create!({id: 7, component_id: 7, nutrient_id: 6, amount: 11.1})

Ingredient.create!({id: 1, recipe_id: 1, component_id: 1, amount: 4 })
Ingredient.create!({id: 2, recipe_id: 1, component_id: 2, amount: 1});
Ingredient.create!({id: 3, recipe_id: 2, component_id: 1, amount: 3});
Ingredient.create!({id: 4, recipe_id: 1, component_id: 3, amount: 0.75});
Ingredient.create!({id: 5, recipe_id: 1, component_id: 4, amount: 0.7});
Ingredient.create!({id: 6, recipe_id: 1, component_id: 5, amount: 22});
Ingredient.create!({id: 7, recipe_id: 1, component_id: 6, amount: 30});
Ingredient.create!({id: 8, recipe_id: 1, component_id: 7, amount: 67.6});

Recipe.create!({id: 1, user_id: 1, name: 'soylent v 1'})
Recipe.create!({id: 2, user_id: 2, name: 'soylent v 2'})

User.create!({id: 1, name: 'Adam'})
User.create!({id: 2, name: 'Betty'})

# BodyProfile.create!({id: 1, name: 'Super-Active Adult Male, 20-30 years old'})
# BodyProfile.create!({id: 2, name: 'Sedentary Adolescent Female (12-20 years old)'})

# BodyProfileNutrient.create!({id: 1, body_profile_id: 1, nutrient_id: 1, daily_requirement: 2})
# BodyProfileNutrient.create!({id: 2, body_profile_id: 1, nutrient_id: 2, daily_requirement: 1.5})
# BodyProfileNutrient.create!({id: 3, body_profile_id: 2, nutrient_id: 1, daily_requirement: 1.7})
# BodyProfileNutrient.create!({id: 4, body_profile_id: 2, nutrient_id: 2, daily_requirement: 1.3})



# Measure.create!({id: 1, recipe_id: 1, ingredient_id: 1, amount: 4})
# Measure.create!({id: 2, recipe_id: 1, ingredient_id: 2, amount: 1})
# Measure.create!({id: 3, recipe_id: 2, ingredient_id: 1, amount: 3})
# Measure.create!({id: 4, recipe_id: 2, ingredient_id: 2, amount: 0.75})



# IngredientNutrient.create({id: 1, ingredient_id: 1, nutrient_id: 1, amount: 0.9})
# IngredientNutrient.create({id: 2, ingredient_id: 1, nutrient_id: 1, amount: 0.6})
# IngredientNutrient.create({id: 3, ingredient_id: 3, nutrient_id: 3, amount: 3.3})



