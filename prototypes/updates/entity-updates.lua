data.raw["underground-belt"]["underground-belt"].max_distance = 9
data.raw["underground-belt"]["fast-underground-belt"].max_distance = 17
data.raw["underground-belt"]["express-underground-belt"].max_distance = 33


--modify steam engine temp
data.raw.generator["steam-engine"].maximum_temperature = 500
data.raw.generator["steam-engine"].destroy_non_fuel_fluid = false
data.raw.generator["steam-engine"].fluid_usage_per_tick = 0.25

--modify boiler to produce more water
data.raw.boiler.boiler.target_temperature = 250
data.raw.boiler.boiler.energy_consumption = "3.70125MW"
--modify boiler to have burnt result inventory
data.raw.boiler.boiler.energy_source.burnt_inventory_size = 1
data.raw.boiler.boiler.energy_source.fuel_categories = {"chemical", "biomass"}

--modify steam turbine temp
data.raw.generator["steam-turbine"].maximum_temperature = 2000
data.raw.generator["steam-turbine"].fluid_usage_per_tick = 1
data.raw.generator["steam-turbine"].effectivity = 5
data.raw.generator["steam-turbine"].destroy_non_fuel_fluid = false

--increase steam max temp
data.raw.fluid["steam"].max_temperature = 2000

data.raw.fluid["steam"].heat_capacity = "2.1kJ"
data.raw.fluid["water"].heat_capacity = data.raw.fluid["steam"].heat_capacity

data.raw.fluid["water"].max_temperature = 500

--modify reactor to produce more energy
data.raw.reactor["nuclear-reactor"].consumption = "2GW"
data.raw.reactor["nuclear-reactor"].heat_buffer.max_temperature = 2000
data.raw.reactor["nuclear-reactor"].heat_buffer.specific_heat = "40MJ"
data.raw.reactor["nuclear-reactor"].energy_source.effectivity = 2

--modify heat exchanger
data.raw.boiler["heat-exchanger"].target_temperature = 2000
data.raw.boiler["heat-exchanger"].energy_consumption = "1GW"
data.raw.boiler["heat-exchanger"].energy_source.max_temperature = 2000
data.raw.boiler["heat-exchanger"].energy_source.specific_heat = "10MJ"
data.raw.boiler["heat-exchanger"].energy_source.max_transfer = "4GW"

--modify heat pipe
data.raw["heat-pipe"]["heat-pipe"].heat_buffer.max_temperature = 2000
data.raw["heat-pipe"]["heat-pipe"].heat_buffer.max_transfer = "5GW"
data.raw["heat-pipe"]["heat-pipe"].heat_buffer.specific_heat = "10MJ"

data.raw.item["uranium-fuel-cell"].fuel_value = "4GJ"

data.raw["assembling-machine"]["centrifuge"].energy_usage = "250MW"

local burner = {
    type = "burner",
    fuel_categories = {"chemical", "biomass"},
    effectivity = 1,
    fuel_inventory_size = 1,
    burnt_inventory_size = 1,
    emissions_per_minute = {
        pollution = 12
    },
}

--modify assembly machine 1
data.raw["assembling-machine"]["assembling-machine-1"].crafting_speed = 1
data.raw["assembling-machine"]["assembling-machine-1"].energy_source = table.deepcopy(burner)
data.raw["assembling-machine"]["assembling-machine-1"].fluid_boxes = data.raw["assembling-machine"]["assembling-machine-2"].fluid_boxes
table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "crafting-with-fluid")

--modify assembly machine 2
data.raw["assembling-machine"]["assembling-machine-2"].crafting_speed = 2
data.raw["assembling-machine"]["assembling-machine-2"].energy_source = table.deepcopy(burner)
table.insert(data.raw["assembling-machine"]["assembling-machine-2"].energy_source.fuel_categories, "jerry")
data.raw["assembling-machine"]["assembling-machine-2"].allowed_effects = {}
data.raw["assembling-machine"]["assembling-machine-2"].module_slots = 0

--modify assembly machine 3
data.raw["assembling-machine"]["assembling-machine-3"].crafting_speed = 4
data.raw["assembling-machine"]["assembling-machine-3"].energy_source = table.deepcopy(burner)
table.insert(data.raw["assembling-machine"]["assembling-machine-3"].energy_source.fuel_categories, "jerry")
data.raw["assembling-machine"]["assembling-machine-3"].allowed_effects = {}
data.raw["assembling-machine"]["assembling-machine-3"].module_slots = 0

--modify mining drill power and speed
data.raw["mining-drill"]["burner-mining-drill"].mining_speed = 1
data.raw["mining-drill"]["burner-mining-drill"].energy_usage = "500kW"
data.raw["mining-drill"]["burner-mining-drill"].resource_searching_radius = 1.99
data.raw["mining-drill"]["burner-mining-drill"].radius_visualisation_picture = {
    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
    width = 12,
    height = 12
}

data.raw["mining-drill"]["electric-mining-drill"].mining_speed = 2
data.raw["mining-drill"]["electric-mining-drill"].energy_usage = "1MW"

data.raw.furnace["stone-furnace"].energy_usage = "200kW"
data.raw.furnace["stone-furnace"].energy_source.fuel_category = nil
data.raw.furnace["stone-furnace"].energy_source.fuel_categories = {"chemical", "biomass"}

data.raw.furnace["steel-furnace"].energy_usage = "500kW"
data.raw.furnace["steel-furnace"].energy_source.fuel_category = nil
data.raw.furnace["steel-furnace"].energy_source.fuel_categories = {"chemical", "biomass"}

RECIPE("steel-furnace"):replace_ingredient("stone-brick", "refined-concrete")


data.raw.inserter["burner-inserter"].energy_source.type = "void"
--data.raw.inserter['burner-inserter'].energy_source.fuel_category = nil
--data.raw.inserter['burner-inserter'].energy_source.fuel_categories = {'chemical', 'biomass'}

data.raw.inserter["inserter"].extension_speed = 0.035
data.raw.inserter["inserter"].rotation_speed = 0.02

data.raw["mining-drill"]["burner-mining-drill"].energy_source.fuel_category = nil
data.raw["mining-drill"]["burner-mining-drill"].energy_source.fuel_categories = {"chemical", "biomass"}

data.raw.furnace["electric-furnace"].energy_usage = "1MW"
data.raw.furnace["electric-furnace"].crafting_speed = 4
data.raw.furnace["electric-furnace"].allowed_effects = nil
data.raw.furnace["electric-furnace"].module_slots = 0

-- Ash space updates
data.raw["mining-drill"]["burner-mining-drill"].energy_source.burnt_inventory_size = 1
data.raw.furnace["stone-furnace"].energy_source.burnt_inventory_size = 1
data.raw.furnace["steel-furnace"].energy_source.burnt_inventory_size = 1
if mods["Companion_Drones"] then
    data.raw["spider-vehicle"]["companion"].energy_source.burnt_inventory_size = 1
end

data.raw.car.car.energy_source.fuel_category = nil
data.raw.car.car.energy_source.fuel_categories = {"jerry", "chemical", "biomass"}
data.raw.car.car.energy_source.burnt_inventory_size = data.raw.car.car.energy_source.fuel_inventory_size
data.raw.car.tank.energy_source.fuel_category = nil
data.raw.car.tank.energy_source.fuel_categories = {"jerry", "chemical", "biomass"}
data.raw.car.tank.energy_source.burnt_inventory_size = data.raw.car.tank.energy_source.fuel_inventory_size
data.raw.locomotive.locomotive.energy_source.fuel_category = nil
data.raw.locomotive.locomotive.energy_source.fuel_categories = {"chemical", "biomass"}
data.raw.locomotive.locomotive.energy_source.burnt_inventory_size = data.raw.locomotive.locomotive.energy_source.fuel_inventory_size

data.raw.inserter["burner-inserter"].filter_count = 1
data.raw.inserter["inserter"].filter_count = 2
data.raw.inserter["long-handed-inserter"].filter_count = 3
data.raw.inserter["fast-inserter"].filter_count = 4
