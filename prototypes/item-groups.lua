data:extend {
    {
        type = "item-group",
        name = "coal-processing",
        order = "t",
        inventory_order = "t",
        icon = "__pycoalprocessinggraphics__/graphics/technology/item-group.png",
        icon_size = 64
    },
--MKS--
    {
        type = "item-subgroup",
        name = "py-cp-buildings-mk01",
        group = "coal-processing",
        order = "a-a"
    },
    {
        type = "item-subgroup",
        name = "py-cp-buildings-mk02",
        group = "coal-processing",
        order = "a-b"
    },
    {
        type = "item-subgroup",
        name = "py-cp-buildings-mk03",
        group = "coal-processing",
        order = "a-c"
    },
    {
        type = "item-subgroup",
        name = "py-cp-buildings-mk04",
        group = "coal-processing",
        order = "a-d"
    },
    {
        type = "item-subgroup",
        name = "py-cp-buildings-others",
        group = "coal-processing",
        order = "a-e"
    },
----------------
    {
        type = "item-subgroup",
        name = "coal-processing",
        group = "coal-processing",
        order = "a1"
    },
    {
        type = "item-subgroup",
        name = "py-power",
        group = "coal-processing",
        order = "a2"
    },
    {
        type = "item-subgroup",
        name = "py-fluid-handling",
        group = "coal-processing",
        order = "c"
    },
    {
        type = "item-subgroup",
        name = "py-items",
        group = "coal-processing",
        order = "c-0"
    },
    {
        type = "item-subgroup",
        name = "py-cans",
        group = "coal-processing",
        order = "c-0a"
    },
    {
        type = "item-subgroup",
        name = "py-items-hpf",
        group = "coal-processing",
        order = "c-1"
    },
    {
        type = "item-subgroup",
        name = "py-items-class",
        group = "coal-processing",
        order = "c-2"
    },
    {
        type = "item-subgroup",
        name = "py-washer",
        group = "coal-processing",
        order = "c-3"
    },
    {
        type = "item-subgroup",
        name = "py-quenching-ores",
        group = "coal-processing",
        order = "d"
    },
    {
        type = "item-subgroup",
        name = "py-syngas",
        group = "coal-processing",
        order = "e"
    },
    {
        type = "item-subgroup",
        name = "py-methanol",
        group = "coal-processing",
        order = "f"
    },
    {
        type = "item-subgroup",
        name = "py-crusher",
        group = "coal-processing",
        order = "g"
    },
    {
        type = "item-subgroup",
        name = "py-drilling",
        group = "coal-processing",
        order = "h"
    },
    {
        type = "item-subgroup",
        name = "py-mill",
        group = "coal-processing",
        order = "i"
    },
    {
        type = "item-subgroup",
        name = "py-filter",
        group = "coal-processing",
        order = "j"
    },
    {
        type = "item-subgroup",
        name = "py-sulfur",
        group = "coal-processing",
        order = "k"
    },
    {
        type = "item-subgroup",
        name = "py-extractor",
        group = "coal-processing",
        order = "l"
    },
    {
        type = "item-subgroup",
        name = "py-combustion",
        group = "coal-processing",
        order = "m"
    },
    {
        type = "item-subgroup",
        name = "py-fluids",
        group = "coal-processing",
        order = "z"
    },
    {
        type = "item-subgroup",
        name = "py-unsorted",
        group = "coal-processing",
        order = "zzzz"
    }
}

data.raw['item-subgroup']['fluid'].group = 'coal-processing'
data.raw['item-subgroup']['fluid'].order = 'c'
data.raw.item['sulfur'].subgroup = 'py-sulfur'
data.raw.item['rocket-control-unit'].subgroup = 'space-related'
data.raw.item['low-density-structure'].subgroup = 'space-related'
data.raw.item['rocket-fuel'].subgroup = 'space-related'
data.raw.item['nuclear-fuel'].subgroup = 'space-related'
data.raw.item['stone'].subgroup = 'intermediate-product'
data.raw.item['explosives'].subgroup = 'py-items'
data.raw.fluid['sulfuric-acid'].subgroup = 'py-fluids'