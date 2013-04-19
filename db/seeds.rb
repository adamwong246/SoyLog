Nutrient.create!({id: 1, name: "Calcium",           fda_rda: 1,     unit: :g})
Nutrient.create!({id: 2, name: 'Potassium',    unit: :g,   fda_rda: 3.5})
Nutrient.create!({id: 3, name: "Vitamin A",         fda_rda: 5000,  unit: :iu})
Nutrient.create!({id: 4, name: "Biotin",            fda_rda: 300,   unit: :ug})
Nutrient.create!({id: 5, name: "Carbohydrates",     fda_rda: 200,   unit: :g})
Nutrient.create!({id: 6, name: "Protein",           fda_rda: 50,    unit: :g})
Nutrient.create!({id: 7, name: "Fat",               fda_rda: 65,    unit: :g})
Nutrient.create!({id: 8, name: "Sodium",            fda_rda: 2.4,   unit: :g})
Nutrient.create!({id: 9, name: "Potassium",         fda_rda: 3.5,   unit: :g})
Nutrient.create!({id: 10,name: "Chloride",          fda_rda: 3.4,   unit: :g})
Nutrient.create!({id: 11,name: "Fiber",             fda_rda: 5,     unit: :g})
Nutrient.create!({id: 12,name: "Iron",              fda_rda: 18,    unit: :mg})
Nutrient.create!({id: 13,name: "Phosphorous",       fda_rda: 1,     unit: :g})
Nutrient.create!({id: 14,name: "Iodine",            fda_rda: 150,   unit: :ug})
Nutrient.create!({id: 15,name: "Magnesium",         fda_rda: 500,   unit: :mg})
Nutrient.create!({id: 16,name: "Zinc",              fda_rda: 15,    unit: :mg})
Nutrient.create!({id: 17,name: "Selenium",          fda_rda: 70,    unit: :ug})
Nutrient.create!({id: 18,name: "Copper",            fda_rda: 2,     unit: :mg})
Nutrient.create!({id: 19,name: "Manganese",         fda_rda: 2,     unit: :mg})
Nutrient.create!({id: 20,name: "Chromium",          fda_rda: 120,   unit: :ug})
Nutrient.create!({id: 21,name: "Molybdenum",        fda_rda: 75,    unit: :ug})
Nutrient.create!({id: 22,name: "Vitamin B6",        fda_rda: 2,     unit: :mg})
Nutrient.create!({id: 23,name: "Vitamin B12",       fda_rda: 6,     unit: :ug})
Nutrient.create!({id: 24,name: "Vitamin C",         fda_rda: 60,    unit: :mg})
Nutrient.create!({id: 25,name: "Vitamin D",         fda_rda: 400,   unit: :iu})
Nutrient.create!({id: 26,name: "Vitamin E",         fda_rda: 30,    unit: :iu})
Nutrient.create!({id: 27,name: "Vitamin K",         fda_rda: 80,    unit: :ug})
Nutrient.create!({id: 28,name: "Thiamin",           fda_rda: 1.5,   unit: :mg})
Nutrient.create!({id: 29,name: "Riboflavin",        fda_rda: 1.8,   unit: :mg})
Nutrient.create!({id: 30,name: "Niacin",            fda_rda: 20,    unit: :mg})
Nutrient.create!({id: 31,name: "Folate",            fda_rda: 400,   unit: :ug})
Nutrient.create!({id: 32,name: "Panthothenic Acid", fda_rda: 10,     unit: :mg})


Component.create!({id: 1, name: 'Calcium Carbonate', unit: :g, url: "http://purebulk.com/calcium-carbonate-powder-usa.html", total_amount: 100, price: 17.50})
Component.create!({id: 2, name: 'Potassium Gluconate', unit: :g, url: "amazon.com2", total_amount: 300, price: 15.50})
Component.create!({id: 3, name: 'Ascorbic Acid', unit: :g, url: "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html", total_amount: 100, price: 5.56})
Component.create!({id: 4, name: 'Biotin (1%)', unit: :g, url: "http://purebulk.com/biotin-1-vitamin-b7-vitamin-h.html", total_amount: 100, price: 9.50})
Component.create!({id: 6, name: 'Power Whey Isolate', unit: :mg, url: "amazon.com", total_amount: 5000, price: 3.56})
Component.create!({id: 5, name: 'Maltodextrin', unit: :g, url: "http://store.honeyvillegrain.com/maltodextrin50lb.aspx", total_amount: 22679.60, price: 60.99})
Component.create!({id: 7, name: 'Extra Light Olive Oil', unit: :l, url: "http://www.amazon.com/Bertolli-Extra-Light-Olive-Oil/dp/B008ELNF0Y/ref=sr_1_4?ie=UTF8&qid=1365725469&sr=8-4&keywords=bertolli+extra+light+olive+oil", total_amount:1.5, price: 13.45})
Component.create!({id: 8, name: 'Whey Protein Isolate (100%)', unit: :g, url: "Whey Protein Isolate (100%)  ", total_amount:2267.96, price: 62.64 })

Component.create!({id: 9, name: 'Iodized Salt', unit: :g, url: "http://www.amazon.com/Hain-Pure-Foods-Salt-Iodized/dp/B000MDACSK/ref=sr_1_cc_1?s=aps&ie=UTF8&qid=1365725608&sr=1-1-catcorr&keywords=hain+iodized+salt", total_amount:737, price: 1.98 })

ComponentNutrient.create!({id: 1, component_id: 1, nutrient_id: 1, amount: 0.9})
ComponentNutrient.create!({id: 2, component_id: 2, nutrient_id: 2, amount: 3.3})
ComponentNutrient.create!({id: 3, component_id: 3, nutrient_id: 3, amount: 1.1})
ComponentNutrient.create!({id: 4, component_id: 4, nutrient_id: 4, amount: 0.1})
ComponentNutrient.create!({id: 5, component_id: 5, nutrient_id: 5, amount: 0.1})
ComponentNutrient.create!({id: 6, component_id: 6, nutrient_id: 6, amount: 11.1})
ComponentNutrient.create!({id: 7, component_id: 7, nutrient_id: 7, amount: 40})
ComponentNutrient.create!({id: 8, component_id: 9, nutrient_id: 8, amount: 6})

Ingredient.create!({id: 1, recipe_id: 1, component_id: 1, amount: 4 })
Ingredient.create!({id: 2, recipe_id: 1, component_id: 2, amount: 1});
Ingredient.create!({id: 4, recipe_id: 1, component_id: 3, amount: 0.75});
Ingredient.create!({id: 5, recipe_id: 1, component_id: 4, amount: 0.7});
Ingredient.create!({id: 6, recipe_id: 1, component_id: 5, amount: 22});
Ingredient.create!({id: 7, recipe_id: 1, component_id: 6, amount: 30});
Ingredient.create!({id: 8, recipe_id: 1, component_id: 7, amount: 67.6});
Ingredient.create!({id: 9, recipe_id: 1, component_id: 9, amount: 67.6});

r = Recipe.create!({id: 1, user_id: 1, name: 'soylent v 1'})

User.create!(:name => 'Eustace User', :email => 'EustaceUser@email.com', :password => "eustace_user_123", :password_confirmation => 'eustace_user_123')
User.create!(:name => 'Andy Admin', :email => 'AndyAdmin@email.com', :password => "andy_admin_123", :password_confirmation => 'andy_admin_123')
###
# i = r.ingredients.create({amount: 67.6})
# i.save
# c = i.create_component!({name: "Iodized salt", url: "anywhere", unit: :g, total_amount: 737, price: 1.97})
# c.save
# cn = c.component_nutrients.create({amount: 3.4})
# cn.component = c
# cn.save
# n = cn.create_nutrient({name: 'Chloride', unit: :g,   fda_rda: 3.4})
# n.save



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



