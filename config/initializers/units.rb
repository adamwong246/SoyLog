Unit.define("capsule") do |capsule|
  # capsule.definition   = Unit("1 capsule")   # anything that results in a Unit object
  capsule.aliases      = %w{capsule}                   # array of synonyms for the unit
  capsule.display_name = "Capsule"                        # How unit is displayed when output
  capsule.scalar = 1
end

Unit.define("mcg") do |mcg|
  mcg.definition   = Unit("1,000,000 g") 
  mcg.definition   = Unit("1,000   mg")   # anything that results in a Unit object
  # mcg.aliases      = %w{capsule}                   # array of synonyms for the unit
  # mcg.display_name = "Microgram"                        # How unit is displayed when output
  mcg.scalar = 1
end



