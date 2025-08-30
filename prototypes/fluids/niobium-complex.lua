RECIPE({
    type = "recipe",
    name = "niobium-complex",
    category = "chemistry",
    enabled = false,
    energy_required = 3.5,
    ingredients = {
        { type = "fluid", name = "organic-solvent",     amount = 50 },
        { type = "fluid", name = "water",               amount = 100 },
        { type = "item",  name = "niobium-concentrate", amount = 10 }
    },
    results = {
        { type = "fluid", name = "niobium-complex", amount = 100 }
    },
    subgroup = "py-fluids",
    order = "c"
}):add_unlock("niobium")

FLUID({
    type = "fluid",
    name = "niobium-complex",
    icon = "__pycoalprocessinggraphics__/graphics/icons/niobium-complex.png",
    icon_size = 32,
    default_temperature = 10,
    gas_temperature = 15,
    heat_capacity = "1kJ",
    base_color = { r = 0.482, g = 0.607, b = 0.650 },
    flow_color = { r = 1, g = 1, b = 1 },
    max_temperature = 100,
    subgroup = "py-fluids",
    order = "z-[niobium-complex]"
})
