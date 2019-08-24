RECIPE {
    type = "recipe",
    name = "co2-absorber",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {"gasturbinemk01", 3},
        {"advanced-circuit", 30},
        {"steel-plate", 50},
        {"carbon-filter", 2},
        {"nexelit-plate", 50}
    },
    results = {
        {"co2-absorber", 1}
    }
}:add_unlock("coal-processing-3")

ITEM {
    type = "item",
    name = "co2-absorber",
    icon = "__pycoalprocessing__/graphics/icons/co2-absorber.png",
    icon_size = 32,
    flags = {},
    subgroup = "coal-processing",
    order = "g",
    place_result = "co2-absorber",
    stack_size = 10
}

ENTITY {
    type = "furnace",
    name = "co2-absorber",
    icon = "__pycoalprocessing__/graphics/icons/co2-absorber.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "co2-absorber"},
    fast_replaceable_group = "co2-absorber",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.45, -3.45}, {3.45, 3.45}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"co2"},
    source_inventory_size = 1,
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_second_per_watt = -0.05
    },
    energy_usage = "200kW",
    ingredient_count = 20,
    module_slots = 0,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/co2-absorber/co2-absorber.png",
        width = 278,
        height = 280,
        frame_count = 31,
        line_length = 7,
        animation_speed = 0.5,
        shift = {0.83, -0.869}
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.55},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/co2-absorber.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/co2-absorber.ogg", volume = 0.60},
        apparent_volume = 1.0
    }
}
