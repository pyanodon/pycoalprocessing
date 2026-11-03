RECIPE {
    type = "recipe",
    name = "py-iron-oxide",
    category = "hpf",
    enabled = false,
    ingredients = {
        {type = "item",  name = "iron-oxide",        amount = 4},
        {type = "item",  name = "pipe",              amount = 1},
        {type = "fluid", name = "muddy-sludge", amount = 20}
    },
    results = {
        {type = "item", name = "py-iron-oxide", amount = 2}
    },
    requester_paste_multiplier = 4,
    energy_required = 3
}:add_unlock("py-asphalt")

ITEM {
    type = "item",
    name = "py-iron-oxide",
    icon = "__pyindustrygraphics__/graphics/icons/py-iron-oxide.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-tiles",
    order = "a-iron-oxide",
    stack_size = 1000,
    place_as_tile = {result = "py-iron-oxide", condition_size = 1, condition = {layers = {water_tile = true}}}
}

TILE {
    type = "tile",
    name = "py-iron-oxide",
    needs_correction = false,
    minable = {mining_time = 0.1, result = "py-iron-oxide"},
    mined_sound = {filename = "__base__/sound/deconstruct-bricks.ogg"},
    collision_mask = {layers = {ground_tile = true}},
    walking_speed_modifier = 3.5,
    decorative_removal_probability = 1,
    layer = 76,
    layer_group = "ground-artificial",
    walking_sound = {
        {
            filename = "__pyindustrygraphics__/sounds/iron-foot-01.ogg",
            volume = 0.3,
            speed = 1.2
        },
        {
            filename = "__pyindustrygraphics__/sounds/iron-foot-02.ogg",
            volume = 0.3,
            speed = 1.2
        },
        {
            filename = "__pyindustrygraphics__/sounds/iron-foot-03.ogg",
            volume = 0.3,
            speed = 1.2
        },
        {
            filename = "__pyindustrygraphics__/sounds/iron-foot-04.ogg",
            volume = 0.3,
            speed = 1.2
        }
    },
    map_color = {r = 87, g = 33, b = 3, a = 1},
    absorptions_per_second = {pollution = 0},
    vehicle_friction_modifier = 0.75,
    variants = {
        transition = table.deepcopy(TILE("concrete").variants.transition),
        material_background =
        {
            picture = "__pyindustrygraphics__/graphics/tiles/py-iron-oxide/py-iron-oxide.png",
            count = 2,
            scale = 0.5
        }
    }
}
