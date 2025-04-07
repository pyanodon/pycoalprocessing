if not feature_flags.space_travel then return end

local MAX_BELT_STACK = 8

data:extend {py.merge(data.raw.inserter["bulk-inserter"], {
    name = "py-stack-inserter",
    wait_for_full_hand = true,
    enter_drop_mode_if_held_stack_spoiled = true,
    max_belt_stack_size = MAX_BELT_STACK,
    use_easter_egg = false,
    stack_size_bonus = (data.raw.inserter["bulk-inserter"].stack_size_bonus or 0) + 12,
    hand_size = 2.25,
    insert_position = {0, 1.7},
    pickup_position = {0, -1.5},
    collision_box = {{-0.15, -0.65}, {0.15, 0.65}},
    selection_box = {{-0.4, -0.9}, {0.4, 0.9}},
    energy_per_movement = "102.564102564kJ",
    energy_per_rotation = "102.564102564kJ",
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        drain = "800kW",
    },
    rotation_speed = data.raw.inserter.inserter.rotation_speed * 1.7,
    minable = {
        mining_time = 0.2,
        result = "py-stack-inserter"
    },
    platform_picture = {sheet = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/stack-inserter/stack-inserter-platform.png",
        height = 79,
        priority = "extra-high",
        scale = 0.5,
        shift = {0.046875, 0.203125},
        width = 105
    }},
    hand_open_picture = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/stack-inserter/stack-inserter-hand-open.png",
        height = 164,
        priority = "extra-high",
        scale = 0.5,
        width = 72
    },
    hand_closed_picture = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/stack-inserter/stack-inserter-hand-closed.png",
        height = 164,
        priority = "extra-high",
        scale = 0.5,
        width = 72
    },
    hand_base_picture = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/stack-inserter/stack-inserter-hand-base.png",
        height = 136,
        priority = "extra-high",
        scale = 0.5,
        width = 32
    },
    fast_replaceable_group = "nil",
    next_upgrade = "nil",
    icon = "__pycoalprocessinggraphics__/graphics/icons/stack-inserter.png",
    icon_size = 64
})}

ITEM {
    icon = "__pycoalprocessinggraphics__/graphics/icons/stack-inserter.png",
    icon_size = 64,
    name = "py-stack-inserter",
    place_result = "py-stack-inserter",
    order = "h[stack-inserter]",
    stack_size = 50,
    subgroup = "inserter",
    type = "item"
}

RECIPE {
    type = "recipe",
    name = "py-stack-inserter",
    enabled = false,
    results = {{type = "item", name = "py-stack-inserter", amount = 1}},
    ingredients = {
        {type = "item", name = "fast-inserter",      amount = 3},
        {type = "item", name = "electronic-circuit", amount = 5},
    },
    energy_required = 2,
}:add_ingredient {"small-parts-01", 10}:add_ingredient {"belt", 3}:add_ingredient {"engine-unit", 3}:add_ingredient {type = "fluid", name = "lubricant", amount = 200}:add_ingredient {"nbfe-alloy", 10}
