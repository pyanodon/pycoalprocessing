if not bobmods.lib.resource then bobmods.lib.resource = {} end


function bobmods.lib.resource.create_autoplace(inputs)
-- note: Use size 1 for stone size, 1.5 for iron/copper/coal size, over 2 is untested.
  local autoplace = {control = inputs.control or inputs.name}
  local richness = inputs.richness or 1
  local size = inputs.size and inputs.size or 1.2
  autoplace.sharpness = 1
  autoplace.richness_multiplier = 1250 * richness
  autoplace.richness_base = 400 * richness
  autoplace.richness_multiplier_distance_bonus = 20
  autoplace.coverage = size / 75
  autoplace.peaks = {}
  if inputs.starting_area then
    table.insert(autoplace.peaks,bobmods.lib.resource.autoplace_peak{starting_area = 1, noise = {layer = inputs.name, octaves = -2.5, persistance = 0.3}})
  end
    table.insert(autoplace.peaks,bobmods.lib.resource.autoplace_peak{starting_area = 0, noise = {layer = inputs.name, octaves = -1.5, persistance = 0.3}})
  return autoplace
end


function bobmods.lib.resource.autoplace_peak(inputs)
  local peak = {}
  if inputs.influence then
    influence = inputs.influence
  end
  if inputs.starting_area then
    peak.starting_area_weight_optimal = inputs.starting_area
    peak.starting_area_weight_range = 0
    peak.starting_area_weight_max_range = 2
  end
  if inputs.noise then
    peak.noise_layer = inputs.noise.layer
    peak.noise_octaves_difference = inputs.noise.octaves
    peak.noise_persistence = inputs.noise.persistance
  end
  return peak
end

function bobmods.lib.resource.add_autoplace_peak(inputs)
  table.insert(data.raw.resource[inputs.resource].autoplace.peaks,bobmods.lib.resource.autoplace_peak(inputs))
end



function bobmods.lib.resource.add_result(resource, item)
  if data.raw.resource[resource] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item(item).name) then
    bobmods.lib.result_check(data.raw.resource[resource].minable)
    bobmods.lib.item.add_new(data.raw.resource[resource].minable.results, item)
  else
    if not data.raw.resource[resource] then
      log("Resource " .. resource .. " does not exist.")
    end
    if not bobmods.lib.item.get_type(item) then
      log("Ingredient " .. bobmods.lib.item.basic_item(item).name .. " does not exist.")
    end
  end
end

function bobmods.lib.resource.remove_result(resource, item)
  if data.raw.resource[resource] then
    bobmods.lib.result_check(data.raw.resource[resource].minable)
    bobmods.lib.item.remove(data.raw.resource[resource].minable.results, item)
  else
    log("Resource " .. resource .. " does not exist.")
  end
end


function bobmods.lib.resource.stage_counts(stages, mult)
  local stage_counts = {}
  local stage = stages
  while stage > 0 do
    stage = stage - 1
    table.insert(stage_counts, mult * (2^stage))
  end
  return stage_counts
end

function bobmods.lib.resource.sprite(inputs)
  local filename
  local width = 38
  local height = 38
  local frame_count = 4
  local variation_count = 8
  if inputs.width then width = inputs.width end
  if inputs.height then height = inputs.height end
  if inputs.frame_count then frame_count = inputs.frame_count end
  if inputs.variation_count then variation_count = inputs.variation_count end
  if inputs.filename then
    filename = inputs.filename
  else
    filename = "__boblibrary__/graphics/entity/ores/ore-1.png"
    width = 38
    height = 38
    frame_count = 4
    variation_count = 8
    if inputs.sheet == 2 then
      filename = "__boblibrary__/graphics/entity/ores/ore-2.png"
    end
    if inputs.sheet == 3 then
      filename = "__boblibrary__/graphics/entity/ores/ore-3.png"
    end
    if inputs.sheet == 4 then
      filename = "__boblibrary__/graphics/entity/ores/ore-4.png"
    end
    if inputs.sheet == 5 then
      filename = "__boblibrary__/graphics/entity/liquid.png"
      width = 75
      height = 61
      variation_count = 1
    end
  end

  return
  {
    sheet =
    {
      filename = filename,
      priority = "extra-high",
      width = width,
      height = height,
      frame_count = frame_count,
      variation_count = variation_count,
      tint = inputs.tint,
      scale = inputs.scale or 1,
    }
  }
end



function bobmods.lib.resource.create_item(inputs)
  data:extend(
  {
    {
      type = "item",
      name = inputs.name,
      icon = inputs.icon,
      flags = {"goes-to-main-inventory"},
      subgroup = inputs.subgroup and inputs.subgroup or "raw-resource",
      order = "b-d[" .. inputs.name .."]",
      stack_size = inputs.stack_size and inputs.stack_size or 200
    }
  }
  )
end

function bobmods.lib.resource.create(inputs)
  local sprite = {}
  local minimum = 35
  local normal = 350
  if inputs.sprite then
    sprite = inputs.sprite
  end
  sprite.tint = inputs.tint
  if inputs.minimum then
    minimum = inputs.minimum
  elseif inputs.autoplace and inputs.autoplace.richness_base then
    minimum = inputs.autoplace.richness_base /10
  end
  if inputs.normal then
    normal = inputs.normal
  elseif inputs.autoplace and inputs.autoplace.richness_base then
    normal = inputs.autoplace.richness_base
  end
  local sheet = bobmods.lib.resource.sprite(sprite)
  data:extend(
  {
    {
      type = "resource",
      name = inputs.name,
      icon = inputs.icon,
      flags = {"placeable-neutral"},
      category = inputs.category,
      order = "b-d-" .. inputs.name,
      minimum = minimum,
      normal = normal,
      infinite = inputs.infinite,
      collision_box = inputs.collision_box or {{ -0.1, -0.1}, {0.1, 0.1}},
      selection_box = inputs.selection_box or {{ -0.5, -0.5}, {0.5, 0.5}},
      stages = sheet,
      stage_counts = bobmods.lib.resource.stage_counts(sheet.sheet.variation_count, inputs.stage_mult or 10),
      map_color = inputs.map_color,
      minable =
      {
        mining_particle = inputs.particle,
        hardness = inputs.hardness or 0.9,
        mining_time = inputs.mining_time or 2,
      },
    }
  }
  )
  if inputs.disable_map_grid then
    data.raw.resource[inputs.name].map_grid = false
  end
end

function bobmods.lib.resource.create_particle(inputs)
data:extend(
{
  {
    type = "particle",
    name = inputs.name,
    flags = {"not-on-map"},
    life_time = 180,
    pictures =
    {
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-1.png",
        priority = "extra-high",
        tint = inputs.tint,
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-2.png",
        priority = "extra-high",
        tint = inputs.tint,
        width = 7,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-3.png",
        priority = "extra-high",
        tint = inputs.tint,
        width = 6,
        height = 7,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-4.png",
        priority = "extra-high",
        tint = inputs.tint,
        width = 9,
        height = 8,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-5.png",
        priority = "extra-high",
        tint = inputs.tint,
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-6.png",
        priority = "extra-high",
        tint = inputs.tint,
        width = 6,
        height = 4,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-7.png",
        priority = "extra-high",
        tint = inputs.tint,
        width = 7,
        height = 8,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-8.png",
        priority = "extra-high",
        tint = inputs.tint,
        width = 6,
        height = 5,
        frame_count = 1
      }
    },
    shadows =
    {
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-shadow-1.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-shadow-2.png",
        priority = "extra-high",
        width = 7,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-shadow-3.png",
        priority = "extra-high",
        width = 6,
        height = 7,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-shadow-4.png",
        priority = "extra-high",
        width = 9,
        height = 8,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-shadow-5.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-shadow-6.png",
        priority = "extra-high",
        width = 6,
        height = 4,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-shadow-7.png",
        priority = "extra-high",
        width = 7,
        height = 8,
        frame_count = 1
      },
      {
        filename = "__boblibrary__/graphics/entity/ores/ore-particle-shadow-8.png",
        priority = "extra-high",
        width = 6,
        height = 5,
        frame_count = 1
      }
    }
  }
}
)
end


function bobmods.lib.resource.generate_data_stage(inputs)
  if inputs.name then
    if not inputs.particle then
      inputs.particle = inputs.name .. "-particle"
      bobmods.lib.resource.create_particle{name = inputs.particle, tint = inputs.tint}
    end

    if inputs.item and inputs.item.create then
      if not inputs.items then inputs.items = {} end
      bobmods.lib.resource.create_item{name = inputs.name, icon = inputs.icon, subgroup = inputs.item.subgroup, stack_size = inputs.item.stack_size}
      table.insert(inputs.items,{name = inputs.name})
    end

    if not inputs.autoplace then
      inputs.autoplace = bobmods.lib.resource.create_autoplace{control = inputs.autoplace.control or inputs.name, name = inputs.name, starting_area = true, size = 1, richness = 1}
    else
      if inputs.autoplace.create then
        local autoplace = bobmods.lib.resource.create_autoplace{control = inputs.autoplace.control or inputs.name, name = inputs.name, starting_area = inputs.autoplace.starting_area, size = inputs.autoplace.size, richness = inputs.autoplace.richness}
        inputs.autoplace = autoplace
      end
    end

    bobmods.lib.resource.create(inputs)

    if inputs.items then
      for i, item in pairs(inputs.items) do
        bobmods.lib.resource.add_result(inputs.name, item)
      end
    end
  end
end

function bobmods.lib.resource.generate_updates_stage(inputs)
  if data.raw.resource[inputs.name] and inputs.autoplace then
    local control = inputs.autoplace.control or inputs.name
    if not data.raw["autoplace-control"][control] then
      data:extend(
      {
        {
          type = "autoplace-control",
          name = control,
          richness = true,
          order = "b-d-" .. inputs.name
        },
      }
      )
    end
    if not data.raw["noise-layer"][inputs.name] then
      data:extend(
      {
        {
          type = "noise-layer",
          name = inputs.name
        },
      }
      )
    end
    data.raw.resource[inputs.name].autoplace = inputs.autoplace
  end
end

function bobmods.lib.resource.generate(inputs)
  bobmods.lib.resource.generate_data_stage(inputs)
  bobmods.lib.resource.generate_updates_stage(inputs)
end

