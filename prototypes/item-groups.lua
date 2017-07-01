-------------------------------------------------------------------------------
--[[Item Groups and Subgroups]]--
-------------------------------------------------------------------------------
data:extend{
        {
            type = "item-group",
            name = "coal-processing",
            order = "t",
            inventory_order = "t",
            icon = "__pycoalprocessing__/graphics/technology/item-group.png",
            icon_size = 64,
        },
        {
            type = "item-subgroup",
            name = "coal-processing",
            group = "coal-processing",
            order = "a1",
        },
        {
            type = "item-subgroup",
            name = "py-power",
            group = "coal-processing",
            order = "a2",
        },
        {
            type = "item-subgroup",
            name = "py-fluid-handling",
            group = "coal-processing",
            order = "a3",
        },
        {
            type = "item-subgroup",
            name = "py-extraction",
            group = "coal-processing",
            order = "a4",
        },
        {
            type = "item-subgroup",
            name = "py-items",
            group = "coal-processing",
            order = "c",
        },
        {
            type = "item-subgroup",
            name = "py-items-hpf",
            group = "coal-processing",
            order = "c-1",
        },
        {
            type = "item-subgroup",
            name = "py-items-class",
            group = "coal-processing",
            order = "c-2",
        },
        {
            type = "item-subgroup",
            name = "py-washer",
            group = "coal-processing",
            order = "c-3",
        },
        {
            type = "item-subgroup",
            name = "py-quenching-ores",
            group = "coal-processing",
            order = "d",
        },
        {
            type = "item-subgroup",
            name = "py-syngas",
            group = "coal-processing",
            order = "e",
        },
        {
            type = "item-subgroup",
            name = "py-methanol",
            group = "coal-processing",
            order = "f",
        },
        {
            type = "item-subgroup",
            name = "py-crusher",
            group = "coal-processing",
            order = "g",
        },
        {
            type = "item-subgroup",
            name = "py-drilling",
            group = "coal-processing",
            order = "h",
        },
        {
            type = "item-subgroup",
            name = "py-mill",
            group = "coal-processing",
            order = "i",
        },
        {
            type = "item-subgroup",
            name = "py-filter",
            group = "coal-processing",
            order = "j",
        },
        {
            type = "item-subgroup",
            name = "py-sulfur",
            group = "coal-processing",
            order = "k",
        },
        {
            type = "item-subgroup",
            name = "py-extractor",
            group = "coal-processing",
            order = "l",
        },
        {
            type = "item-subgroup",
            name = "py-fluids",
            group = "coal-processing",
            order = "z",
        },
    }
