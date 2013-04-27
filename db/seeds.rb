puts "mark0"
eustace = User.create!(:name => 'Eustace User', :email => 'EustaceUser@email.com', :password => "eustace_user_123", :password_confirmation => 'eustace_user_123')

User.create!(:name => 'Andy Admin', :email => 'AndyAdmin@email.com', :password => "andy_admin_123", :password_confirmation => 'andy_admin_123')
puts "mark1"

recipe = eustace.recipes.create!({id: 1, user_id: 1, name: 'soylent v 1'})

puts "mark2"
nu_biotin            = Nutrient.create!({name: "Biotin",            fda_rda: '300 ug' })
nu_calcium           = Nutrient.create!({name: "Calcium",           fda_rda: '1 g'    })
nu_carbohydrates     = Nutrient.create!({name: "Carbohydrates",     fda_rda: '200 g'  })
nu_chloride          = Nutrient.create!({name: "Chloride",          fda_rda: '3.4 g'  })
nu_chromium          = Nutrient.create!({name: "Chromium",          fda_rda: '120 ug' })
nu_copper            = Nutrient.create!({name: "Copper",            fda_rda: '2 mg'   })
nu_fat               = Nutrient.create!({name: "Fat",               fda_rda: '65 g'   })
nu_fiber             = Nutrient.create!({name: "Fiber",             fda_rda: '5 g'    })
nu_folate            = Nutrient.create!({name: "Folate",            fda_rda: '400 ug' })
nu_iodine            = Nutrient.create!({name: "Iodine",            fda_rda: '150 ug' })
nu_iron              = Nutrient.create!({name: "Iron",              fda_rda: '18 mg'  })
nu_niacin            = Nutrient.create!({name: "Niacin",            fda_rda: '20 mg'  })
nu_manganese         = Nutrient.create!({name: "Manganese",         fda_rda: '2 mg'   })
nu_magnesium         = Nutrient.create!({name: "Magnesium",         fda_rda: '500 mg' })
nu_molybdenum        = Nutrient.create!({name: "Molybdenum",        fda_rda: '75 ug'  })
nu_panthothenic_acid = Nutrient.create!({name: "Panthothenic Acid", fda_rda: '10 mg'  })
nu_phosphorous       = Nutrient.create!({name: "Phosphorous",       fda_rda: '1 g'    })
nu_potassium         = Nutrient.create!({name: 'Potassium',         fda_rda: '3.5 g'  })
nu_protein           = Nutrient.create!({name: "Protein",           fda_rda: '50 g'   })
nu_ribloflavin       = Nutrient.create!({name: "Riboflavin",        fda_rda: '1.8 mg' })
nu_selenium          = Nutrient.create!({name: "Selenium",          fda_rda: '70 ug'  })
nu_sodium            = Nutrient.create!({name: "Sodium",            fda_rda: '2.4 g'  })
nu_thiamin           = Nutrient.create!({name: "Thiamin",           fda_rda: '1.5 mg' })
nu_vitamin_a         = Nutrient.create!({name: "Vitamin A",         fda_rda: '5000 iu'})
nu_vitamin_b_6       = Nutrient.create!({name: "Vitamin B6",        fda_rda: '2 mg'   })
nu_vitamin_b_12      = Nutrient.create!({name: "Vitamin B12",       fda_rda: '6 ug'   })
nu_vitamin_c         = Nutrient.create!({name: "Vitamin C",         fda_rda: '60 mg'  })
nu_vitamin_d         = Nutrient.create!({name: "Vitamin D",         fda_rda: '400 iu' })
nu_vitamin_e         = Nutrient.create!({name: "Vitamin E",         fda_rda: '30 iu'  })
nu_vitamin_k         = Nutrient.create!({name: "Vitamin K",         fda_rda: '80 ug'  })
nu_zinc              = Nutrient.create!({name: "Zinc",              fda_rda: '15 mg'  })

comp_ascorbic_acid        = Component.create!({total_amount: '100 g',       serving_size: '1000 mg',  price: '5.56 USD',  name: 'Ascorbic Acid',                        url: "http://purebulk.com/vitamin-c-ascorbic-acid-powder.html"})
comp_biotin               = Component.create!({total_amount: '1 kg',        serving_size: '77 mg',    price: '9.50 USD',  name: 'Biotin (1%)',                          url: "http://purebulk.com/biotin-1-vitamin-b7-vitamin-h.html"})
comp_c_carbonate          = Component.create!({total_amount: '500 g',       serving_size: '1250 mg',  price: '17.50 USD', name: 'Calcium Carbonate',                    url: "http://purebulk.com/calcium-carbonate-powder-usa.html"})
comp_maltodextrin         = Component.create!({total_amount: '50 lb',       serving_size: '1000 g',   price: '60.99 USD', name: 'Maltodextrin',                         url: "http://store.honeyvillegrain.com/maltodextrin50lb.aspx"})
comp_olive_oil            = Component.create!({total_amount: '68 fl oz',    serving_size: '0 g',      price: '13.45 USD', name: 'Extra Light Olive Oil',                url: "http://www.amazon.com/Bertolli-Extra-Light-Olive-Oil/dp/B008ELNF0Y_1_4?ie=UTF8&qid=1365725469&sr=8-4&keywords=bertolli+extra+light+olive+oil"})
comp_whey                 = Component.create!({total_amount: '2 lbs',       serving_size: '28.25 g',  price: '27.84 USD', name: 'Whey Protein Isolate',                 url: "http://nutrabio.com/Products/whey_protein_isolate.htm#.UXq-LyvwJqI"})
comp_salt                 = Component.create!({total_amount: '26 oz',       serving_size: '1.5 g',    price: '1.98 USD',  name: 'Iodized Salt',                         url: "http://www.amazon.com/Hain-Pure-Foods-Salt-Iodized/dp/B000MDACSK/ref=sr_1_cc_1?s=aps&ie=UTF8&qid=1365725608&sr=1-1-catcorr&keywords=hain+iodized+salt" })
comp_calcium_pantothenate = Component.create!({total_amount: '250 g',       serving_size: '550 mg',   price: '13.50 USD', name: 'Calcium Pantothenate',                 url: 'http://purebulk.com/pantothenic-acid-powder-vitamin-b5-calcium-pantothenate.html'})
comp_cholecalciferol      = Component.create!({total_amount: '560 tablet',  serving_size: '1 tablet', price: '116.06 USD',name: 'Nature Made Vitamin D3',               url: 'http://www.amazon.com/Nature-Made-Vitamin-1000-Tablets/dp/B004UH5ICY/ref=sr_1_6?ie=UTF8&qid=1364955557&sr=8-6&keywords=natures+made+d3'})
comp_gtf                  = Component.create!({total_amount: '120 capsule', serving_size: '1 capsule',price: '5.55 USD',  name: 'Chromium (GTF) Nicotinate Glycinate  ',url: 'http://www.nutrabio.com/Products/chromium-gtf.htm'})
comp_p_citrate            = Component.create!({total_amount: '250 g',       serving_size: '275 mg',  price: '10 USD',    name: 'Potassium Citrate',           url: 'http://purebulk.com/potassium-citrate-powder.html'})

ComponentNutrient.create!({amount: '1000 mg',   component: comp_ascorbic_acid,        nutrient: nu_vitamin_c})
ComponentNutrient.create!({amount: '1 mg',      component: comp_biotin,               nutrient: nu_biotin})
ComponentNutrient.create!({amount: '500 mg',    component: comp_c_carbonate,          nutrient: nu_calcium})
ComponentNutrient.create!({amount: '94 g',      component: comp_maltodextrin,         nutrient: nu_carbohydrates})
ComponentNutrient.create!({amount: '.25 l',     component: comp_olive_oil,            nutrient: nu_fat})
ComponentNutrient.create!({amount: '25 g',      component: comp_whey,                 nutrient: nu_protein})
ComponentNutrient.create!({amount: '590 mg',    component: comp_salt,                 nutrient: nu_chloride})
ComponentNutrient.create!({amount: '0.9 g',     component: comp_salt,                 nutrient: nu_potassium})
ComponentNutrient.create!({amount: '506 mg',    component: comp_calcium_pantothenate, nutrient: nu_panthothenic_acid})
ComponentNutrient.create!({amount: '99 mg',     component: comp_p_citrate,            nutrient: nu_potassium})
ComponentNutrient.create!({amount: '200 mcg',   component: comp_gtf,                  nutrient: nu_chromium})

recipe.ingredients.create!({servings: 0.06, component: comp_ascorbic_acid})
recipe.ingredients.create!({servings: 0.04, component: comp_biotin})
recipe.ingredients.create!({servings: 2,    component: comp_c_carbonate})
recipe.ingredients.create!({servings: 1,    component: comp_calcium_pantothenate})
recipe.ingredients.create!({servings: 1,    component: comp_gtf})
recipe.ingredients.create!({servings: 1,    component: comp_maltodextrin})
recipe.ingredients.create!({servings: 1,    component: comp_olive_oil})
recipe.ingredients.create!({servings: 4,    component: comp_p_citrate})
recipe.ingredients.create!({servings: 1,    component: comp_salt})
recipe.ingredients.create!({servings: 1,    component: comp_whey})


Flag.create!({spam: true})

# recipe.save!

# ComponentNutrient.create!({id: 1, component_id: 1, nutrient_id: 1, amount: 0.9})
# ComponentNutrient.create!({id: 2, component_id: 2, nutrient_id: 2, amount: 3.3})
# ComponentNutrient.create!({id: 3, component_id: 3, nutrient_id: 3, amount: 1.1})
# ComponentNutrient.create!({id: 4, component_id: 4, nutrient_id: 4, amount: 0.1})
# ComponentNutrient.create!({id: 5, component_id: 5, nutrient_id: 5, amount: 0.1})
# ComponentNutrient.create!({id: 6, component_id: 6, nutrient_id: 6, amount: 11.1})
# ComponentNutrient.create!({id: 7, component_id: 7, nutrient_id: 7, amount: 4})
# ComponentNutrient.create!({id: 8, component_id: 9, nutrient_id: 8, amount: 6})

# Ingredient.create!({id: 1, recipe_id: 1, component_id: 1, amount: 4 })
# Ingredient.create!({id: 2, recipe_id: 1, component_id: 2, amount: 1});
# Ingredient.create!({id: 4, recipe_id: 1, component_id: 3, amount: 0.75});
# Ingredient.create!({id: 5, recipe_id: 1, component_id: 4, amount: 0.7});
# Ingredient.create!({id: 6, recipe_id: 1, component_id: 5, amount: 22});
# Ingredient.create!({id: 7, recipe_id: 1, component_id: 6, amount: 30});
# Ingredient.create!({id: 8, recipe_id: 1, component_id: 7, amount: 0.16});
# Ingredient.create!({id: 9, recipe_id: 1, component_id: 9, amount: 0.16});


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



