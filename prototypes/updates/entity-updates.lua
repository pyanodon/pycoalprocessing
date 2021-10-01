
--modify steam engine temp
data.raw.generator['steam-engine'].maximum_temperature = 500

--modify steam turbine temp
data.raw.generator['steam-turbine'].maximum_temperature = 2000
data.raw.generator['steam-turbine'].fluid_usage_per_tick = 60

--increase steam max temp
data.raw.fluid["steam"].max_temperature = 2000

data.raw.fluid["steam"].heat_capacity = "0.4KJ"

data.raw.boiler.boiler.target_temperature = 250

--modify reactor to produce more energy
data.raw.reactor["nuclear-reactor"].consumption = "2GW"

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

data.raw.boiler['heat-exchanger'].target_temperature = 2000
data.raw.boiler['heat-exchanger'].energy_consumption = "4.25GW"
data.raw.boiler['heat-exchanger'].energy_source =
    {
      type = "heat",
      max_temperature = 2000,
      specific_heat = "1MJ",
      max_transfer = "2GW",
      min_working_temperature = 500,
      minimum_glow_temperature = 350,
      connections =
      {
        {
          position = {0, 0.5},
          direction = defines.direction.south
        }
      },
      pipe_covers =
        make_4way_animation_from_spritesheet(
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
          width = 32,
          height = 32,
          direction_count = 4,
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-endings.png",
            width = 64,
            height = 64,
            direction_count = 4,
            scale = 0.5
          }
        }),
      heat_pipe_covers =
        make_4way_animation_from_spritesheet(
        apply_heat_pipe_glow{
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
          width = 32,
          height = 32,
          direction_count = 4,
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-endings-heated.png",
            width = 64,
            height = 64,
            direction_count = 4,
            scale = 0.5
          }
        }),
      heat_picture =
      {
        north = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-N-heated.png",
          priority = "extra-high",
          width = 24,
          height = 48,
          shift = util.by_pixel(-1, 8),
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-N-heated.png",
            priority = "extra-high",
            width = 44,
            height = 96,
            shift = util.by_pixel(-0.5, 8.5),
            scale = 0.5
          }
        },
        east = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-E-heated.png",
          priority = "extra-high",
          width = 40,
          height = 40,
          shift = util.by_pixel(-21, -13),
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-E-heated.png",
            priority = "extra-high",
            width = 80,
            height = 80,
            shift = util.by_pixel(-21, -13),
            scale = 0.5
          }
        },
        south = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-S-heated.png",
          priority = "extra-high",
          width = 16,
          height = 20,
          shift = util.by_pixel(-1, -30),
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-S-heated.png",
            priority = "extra-high",
            width = 28,
            height = 40,
            shift = util.by_pixel(-1, -30),
            scale = 0.5
          }
        },
        west = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-W-heated.png",
          priority = "extra-high",
          width = 32,
          height = 40,
          shift = util.by_pixel(23, -13),
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-W-heated.png",
            priority = "extra-high",
            width = 64,
            height = 76,
            shift = util.by_pixel(23, -13),
            scale = 0.5
          }
        }
      }
    }
