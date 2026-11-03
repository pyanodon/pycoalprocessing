data:extend {{
    type = "generator-equipment",
    name = "portable-gasoline-generator",
    power = "180kW",
    burner = {
        type = "burner",
        emissions_per_minute = {
            pollution = 6
        },
        fuel_inventory_size = 4,
        burnt_inventory_size = 4,
        fuel_categories = {"jerry"}
    },
    energy_source = {
        type = "electric",
        usage_priority = "secondary-output"
    },
    categories = {"armor"},
    shape = {type = "full", width = 2, height = 2},
    sprite = {
        width = 64,
        height = 64,
        filename = "__pyindustrygraphics__/graphics/icons/gasoline-burner.png"
    }
}}

ITEM {
    type = "item",
    name = "portable-gasoline-generator",
    icon = "__pyindustrygraphics__/graphics/icons/gasoline-burner.png",
    icon_size = 64,
    subgroup = "py-generator-equipment",
    order = "a[energy-source]-a[portable-gasoline-generator]",
    stack_size = 10,
    place_as_equipment_result = "portable-gasoline-generator",
    localised_description = {"equipment-description.portable-gasoline-generator"}
}

RECIPE {
    type = "recipe",
    name = "portable-gasoline-generator",
    energy_required = 10,
    category = "crafting",
    enabled = false,
    ingredients = {
        {type = "item", name = "engine-unit",         amount = 4},
        {type = "item", name = "boiler",              amount = 1},
        {type = "item", name = "steel-plate",         amount = 20},
        {type = "item", name = "iron-gear-wheel",     amount = 14},
        {type = "item", name = "small-electric-pole", amount = 1}
    },
    results = {
        {type = "item", name = "portable-gasoline-generator", amount = 1}
    }
}:add_unlock("personal-roboport-equipment")

data.raw.recipe["personal-roboport-equipment"].ingredients = {
    {type = "item", name = "iron-gear-wheel",    amount = 45},
    {type = "item", name = "steel-plate",        amount = 20},
    {type = "item", name = "electronic-circuit", amount = 10},
    {type = "item", name = "battery",            amount = 10},
}

data.raw.technology["personal-roboport-equipment"].prerequisites = {"construction-robotics"}
data.raw.technology["personal-roboport-equipment"].unit.count = 300
data.raw.technology["personal-roboport-mk2-equipment"]:remove_prereq("solar-panel-equipment")
