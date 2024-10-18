if not feature_flags.space_travel then return end

for _, miner in pairs(data.raw["mining-drill"]) do
    miner.drops_full_belt_stacks = true
end

local science_packs_that_unlock_belt_stacking = {
    "py-science-pack-mk01",
    "logistic-science-pack",
    "py-science-pack-mk02",
    "chemical-science-pack",
    "py-science-pack-mk03",
    "production-science-pack",
    "py-science-pack-mk04",
    "utility-science-pack",
}

local i = 1
for _, science in pairs(science_packs_that_unlock_belt_stacking) do
    if not data.raw.technology[science] then goto continue end

    local prerequisites = {science}
    if i > 1 then
        prerequisites = {"transport-belt-capacity-" .. (i - 1)}
    end

    local tech = {
        type = "technology",
        name = "transport-belt-capacity-" .. i,
        localised_description = {"technology-description.belt-capacity"},
        icons = util.technology_icon_constant_stack_size("__pycoalprocessinggraphics__/graphics/technology/transport-belt-capacity.png"),
        effects = {
            {
                type = "belt-stack-size-bonus",
                modifier = 1
            }
        },
        prerequisites = prerequisites,
        unit = {
            count = 2000,
            ingredients =
            {
                {science,   1}
            },
            time = 60
        },
        upgrade = true
    }

    data:extend{tech}

    ::continue::
end
