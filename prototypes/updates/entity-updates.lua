
--modify steam engine temp
data.raw.generator['steam-engine'].maximum_temperature = 500

--modify boiler to produce more water
data.raw.boiler.boiler.target_temperature = 250
data.raw.boiler.boiler.energy_consumption = "14.805MW"

--modify steam turbine temp
data.raw.generator['steam-turbine'].maximum_temperature = 2000
data.raw.generator['steam-turbine'].fluid_usage_per_tick = 1
data.raw.generator['steam-turbine'].effectivity = 10

--increase steam max temp
data.raw.fluid["steam"].max_temperature = 2000

data.raw.fluid["steam"].heat_capacity = "1KJ"

data.raw.fluid["water"].heat_capacity = "2.1KJ"

--modify reactor to produce more energy
data.raw.reactor["nuclear-reactor"].consumption = "2GW"
data.raw.reactor["nuclear-reactor"].heat_buffer.max_temperature = 2000
data.raw.reactor["nuclear-reactor"].heat_buffer.specific_heat = "40MJ"
data.raw.reactor["nuclear-reactor"].energy_source.effectivity = 2

--modify heat exchanger
data.raw.boiler['heat-exchanger'].target_temperature = 2000
data.raw.boiler['heat-exchanger'].energy_consumption = "1GW"
data.raw.boiler['heat-exchanger'].energy_source.max_temperature = 2000
data.raw.boiler['heat-exchanger'].energy_source.specific_heat = "10MJ"
data.raw.boiler['heat-exchanger'].energy_source.max_transfer = "4GW"

--modify heat pipe
data.raw['heat-pipe']['heat-pipe'].heat_buffer.max_temperature = 2000
data.raw['heat-pipe']['heat-pipe'].heat_buffer.max_transfer = "5GW"
data.raw['heat-pipe']['heat-pipe'].heat_buffer.specific_heat = "10MJ"

data.raw.item["uranium-fuel-cell"].fuel_value = "4GJ"

data.raw["assembling-machine"]["centrifuge"].energy_usage = "250MW"

--modify assembly machine 1
data.raw['assembling-machine']['assembling-machine-1'].ingredient_count = 2
data.raw['assembling-machine']['assembling-machine-1'].energy_usage = "200KW"
data.raw['assembling-machine']['assembling-machine-1'].crafting_speed = 1
--local fluid_boxes = {}
--table.insert(data.raw['assembling-machine']['assembling-machine-1'], fluid_boxes)
data.raw['assembling-machine']['assembling-machine-1'].fluid_boxes = data.raw['assembling-machine']['assembling-machine-2'].fluid_boxes
table.insert(data.raw['assembling-machine']['assembling-machine-1'].crafting_categories, "crafting-with-fluid")

--modify assembly machine 2
data.raw['assembling-machine']['assembling-machine-2'].ingredient_count = 4
data.raw['assembling-machine']['assembling-machine-2'].energy_usage = "500KW"
data.raw['assembling-machine']['assembling-machine-2'].crafting_speed = 2
data.raw['assembling-machine']['assembling-machine-2'].allowed_effects = nil
data.raw['assembling-machine']['assembling-machine-2'].module_specification = nil

--modify assembly machine 3
data.raw['assembling-machine']['assembling-machine-3'].ingredient_count = 6
data.raw['assembling-machine']['assembling-machine-3'].energy_usage = "1MW"
data.raw['assembling-machine']['assembling-machine-3'].crafting_speed = 4
data.raw['assembling-machine']['assembling-machine-3'].allowed_effects = nil
data.raw['assembling-machine']['assembling-machine-3'].module_specification = nil

--modify mining drill power and speed
data.raw['mining-drill']['burner-mining-drill'].mining_speed = 1
data.raw['mining-drill']['burner-mining-drill'].energy_usage = '500KW'

data.raw['mining-drill']['electric-mining-drill'].mining_speed = 2
data.raw['mining-drill']['electric-mining-drill'].energy_usage = '1MW'

data.raw.furnace["steel-furnace"].energy_usage = "500kW"

data.raw.furnace["electric-furnace"].energy_usage = "1MW"
data.raw.furnace["electric-furnace"].crafting_speed = 4
data.raw.furnace["electric-furnace"].allowed_effects = nil
data.raw.furnace["electric-furnace"].module_specification = nil
