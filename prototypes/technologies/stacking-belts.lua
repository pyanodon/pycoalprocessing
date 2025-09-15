if not feature_flags.space_travel then return end

local MAX_BELT_STACK = data.raw.inserter["py-stack-inserter"].max_belt_stack_size

data.raw["utility-constants"].default.max_belt_stack_size = MAX_BELT_STACK

for _, stackable_prototype in pairs {"loader-1x1", "loader", "inserter"} do
    for _, stackable in pairs(data.raw[stackable_prototype]) do
        stackable.max_belt_stack_size = stackable.max_belt_stack_size or 1
        if stackable.max_belt_stack_size ~= 1 then
            stackable.max_belt_stack_size = MAX_BELT_STACK
        end
    end
end

for _, miner in pairs(data.raw["mining-drill"]) do
    miner.drops_full_belt_stacks = true
end

local science_packs_that_unlock_belt_stacking = {
    ["logistic-science-pack"] = "logistic-science-pack",
    ["py-science-pack-2"] = "py-science-pack-2",
    ["chemical-science-pack"] = "chemical-science-pack",
    ["py-science-pack-3"] = "py-science-pack-3",
    ["production-science-pack"] = "production-science-pack",
    ["py-science-pack-4"] = "py-science-pack-4",
    ["utility-science-pack"] = "utility-science-pack",
}

local i = 1
for science, pack in pairs(science_packs_that_unlock_belt_stacking) do
    if not data.raw.technology[science] then goto continue end

    if i > 1 then
        prerequisites = {science, "py-transport-belt-capacity-" .. (i - 1)}
    else
        prerequisites = {"fast-inserter"}
    end

    local tech = {
        type = "technology",
        name = "py-transport-belt-capacity-" .. i,
        localised_name = {"technology-name.transport-belt-capacity"},
        localised_description = {"technology-description.belt-capacity"},
        icons = util.technology_icon_constant_stack_size("__pycoalprocessinggraphics__/graphics/technology/transport-belt-capacity.png"),
        effects = {{
            type = "belt-stack-size-bonus",
            modifier = 1
        }},
        prerequisites = prerequisites,
        unit = {
            count = 2000,
            ingredients = {
                {pack, 1}
            },
            time = 60
        },
        upgrade = true
    }

    if i == 1 then
        table.insert(tech.effects, {
            type = "unlock-recipe",
            recipe = "py-stack-inserter"
        })
    end

    data:extend {tech}
    i = i + 1

    ::continue::
end
