local item_sounds = require("__base__.prototypes.item_sounds")

local function add_sound_single(name, move_sound, pick_sound, drop_sound)
    if not move_sound then error("Missing move_sound") end
    if not pick_sound then error("Missing pick_sound") end
    if not drop_sound then error("Missing drop_sound") end

    for item_type in pairs(defines.prototypes.item) do
        local item = (data.raw[ item_type ] or {})[ name ]
        if item then
            item.inventory_move_sound = move_sound
            item.pick_sound = pick_sound
            item.drop_sound = drop_sound
            return
        end
    end
    log("Item Sounds: Could not find item " .. name)
end

local function add_sound_multiple(format, first, last, move_sound, pick_sound, drop_sound)
    for i = first, last do
        local name = string.format(format, i)
        add_sound_single(name, move_sound, pick_sound, drop_sound)
    end
end


--for f, fluid in pairs(data.raw.fluid) do
--    if fluid.fuel_value and not skipped_fluids[fluid.name] and fluid.auto_barrel ~= false then
--        add_sound_single(fluid.name .. "-canister", item_sounds.barrel_inventory_move, item_sounds.barrel_inventory_pickup, item_sounds.barrel_inventory_move)
--    end
--end

-- PyCoal
add_sound_single("ash", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.sulfur_inventory_move)
add_sound_single("chromium", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
    item_sounds.metal_small_inventory_move)
add_sound_single("gravel", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("coke", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("nichrome", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
    item_sounds.metal_small_inventory_move)
add_sound_single("iron-oxide", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("active-carbon", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("zinc-chloride", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("tailings-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.sulfur_inventory_move)
add_sound_single("soil", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("nexelit-ore", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("drill-head", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
    item_sounds.metal_small_inventory_move)
add_sound_single("sand", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.sulfur_inventory_move)
add_sound_single("pure-sand", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.sulfur_inventory_move)
add_sound_single("limestone", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("organics", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("coarse", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("rich-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.sulfur_inventory_move)
add_sound_single("coal-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.sulfur_inventory_move)
add_sound_single("chromite-sand", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.sulfur_inventory_move)
add_sound_single("nexelit-plate", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
    item_sounds.metal_small_inventory_move)
add_sound_single("sand-casting", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("lithium-peroxide", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("nexelit-cartridge", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_single("saturated-nexelit-cartridge", item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("lime", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.sulfur_inventory_move)
add_sound_single("fuelrod-mk01", item_sounds.nuclear_inventory_move, item_sounds.nuclear_inventory_pickup,
    item_sounds.nuclear_inventory_move)
add_sound_single("fawogae", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("fawogae-substrate", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("flask", item_sounds.science_inventory_move, item_sounds.science_inventory_pickup,
    item_sounds.science_inventory_move)
add_sound_single("bonemeal", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("raw-borax", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("borax", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("ralesia", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("ralesia", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("rich-clay", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("ground-sample01", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("bio-sample01", item_sounds.science_inventory_move, item_sounds.science_inventory_pickup,
    item_sounds.science_inventory_move)
add_sound_single("alien-sample01", item_sounds.science_inventory_move, item_sounds.science_inventory_pickup,
    item_sounds.science_inventory_move)
add_sound_single("equipment-chassi", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
    item_sounds.metal_small_inventory_move)
add_sound_single("lab-instrument", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
    item_sounds.metal_small_inventory_move)
add_sound_single("lens", item_sounds.science_inventory_move, item_sounds.science_inventory_pickup,
    item_sounds.science_inventory_move)
add_sound_single("boron-trioxide", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("ralesia-seeds", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("niobium-ore", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("niobium-powder", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("niobium-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.sulfur_inventory_move)
add_sound_single("niobium-concentrate", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
--add_sound("mukmoux-fat", , )
add_sound_single("niobium-oxide", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("niobium-plate", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
    item_sounds.metal_small_inventory_move)
add_sound_single("glass-core", item_sounds.science_inventory_move, item_sounds.science_inventory_pickup,
    item_sounds.science_inventory_move)
add_sound_single("cladding", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
    item_sounds.metal_small_inventory_move)
add_sound_single("ppd", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("kevlar", item_sounds.wire_inventory_move, item_sounds.wire_inventory_pickup,
    item_sounds.wire_inventory_move)
add_sound_single("kevlar-coating", item_sounds.wire_inventory_move, item_sounds.wire_inventory_pickup,
    item_sounds.wire_inventory_move)
add_sound_single("nbfe-alloy", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
    item_sounds.metal_small_inventory_move)
add_sound_single("nbfe-coating", item_sounds.wire_inventory_move, item_sounds.wire_inventory_pickup,
    item_sounds.wire_inventory_move)
add_sound_single("cladded-core", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
    item_sounds.metal_small_inventory_move)
add_sound_single("copper-coating", item_sounds.wire_inventory_move, item_sounds.wire_inventory_pickup,
    item_sounds.wire_inventory_move)
add_sound_single("optical-fiber", item_sounds.wire_inventory_move, item_sounds.wire_inventory_pickup,
    item_sounds.wire_inventory_move)
add_sound_single("biofilm", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("filtration-media", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("coal-briquette", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("crushed-iron", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("crushed-copper", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("log", item_sounds.wood_inventory_move, item_sounds.wood_inventory_pickup,
    item_sounds.wood_inventory_move)
add_sound_single("treated-wood", item_sounds.wood_inventory_move, item_sounds.wood_inventory_pickup,
    item_sounds.wood_inventory_move)
add_sound_single("empty-fuel-canister", item_sounds.metal_chest_inventory_move, item_sounds.metal_chest_inventory_pickup,
    item_sounds.metal_chest_inventory_move)
add_sound_single("crushed-quartz", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.resource_inventory_move)
add_sound_single("powdered-quartz", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.sulfur_inventory_move)
add_sound_single("gunpowder", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
    item_sounds.sulfur_inventory_move)
add_sound_single("methanol-canister", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
    item_sounds.metal_small_inventory_move)
add_sound_single("methanol-gas-canister", item_sounds.metal_small_inventory_move,
    item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)

local mk = 1
if mods.pyrawores then mk = 4 end

add_sound_single("borax-mine", item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
    item_sounds.drill_inventory_move)
add_sound_multiple("borax-mine-mk%02d", 2, mk, item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
    item_sounds.drill_inventory_move)
add_sound_multiple("glassworks-mk%02d", 1, mk, item_sounds.metal_large_inventory_move,
    item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
add_sound_multiple("advanced-foundry-mk%02d", 1, mk, item_sounds.metal_large_inventory_move,
    item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
add_sound_single("fawogae-plantation-mk01", item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_multiple("automated-factory-mk%02d", 1, mk, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("ground-borer", item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
    item_sounds.drill_inventory_move)
add_sound_multiple("ground-borer-mk%02d", 2, mk, item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
    item_sounds.drill_inventory_move)
add_sound_multiple("wpu-mk%02d", 1, mk, item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("ball-mill-mk%02d", 1, mk, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_multiple("chemical-plant-mk%02d", 1, mk, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_single("carbon-filter", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("carbon-filter-mk%02d", 2, mk, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("sand-extractor", item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
    item_sounds.drill_inventory_move)
add_sound_multiple("sand-extractor-mk%02d", 2, mk, item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
    item_sounds.drill_inventory_move)
add_sound_single("botanical-nursery", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("botanical-nursery-mk%02d", 2, mk, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("classifier", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("classifier-mk%02d", 2, mk, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("ralesia-plantation-mk01", item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_multiple("soil-extractor-mk%02d", 1, mk, item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
    item_sounds.drill_inventory_move)
add_sound_single("desulfurizator-unit", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("desulfurizator-unit-mk%02d", 2, mk, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("distilator", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("distilator-mk%02d", 2, mk, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("evaporator", item_sounds.steam_inventory_move, item_sounds.steam_inventory_pickup,
    item_sounds.steam_inventory_move)
add_sound_multiple("evaporator-mk%02d", 2, mk, item_sounds.steam_inventory_move, item_sounds.steam_inventory_pickup,
    item_sounds.steam_inventory_move)
add_sound_single("fluid-separator", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_multiple("fluid-separator-mk%02d", 2, mk, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_single("fts-reactor", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("fts-reactor-mk%02d", 2, mk, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_single("gasifier", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("gasifier-mk%02d", 2, mk, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("hpf", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
    item_sounds.metal_large_inventory_move)
add_sound_multiple("hpf-mk%02d", 2, mk, item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
    item_sounds.metal_large_inventory_move)
add_sound_single("methanol-reactor", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_multiple("methanol-reactor-mk%02d", 2, mk, item_sounds.fluid_inventory_move, item_sounds
    .fluid_inventory_pickup, item_sounds.fluid_inventory_move)
add_sound_single("olefin-plant", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_multiple("olefin-plant-mk%02d", 2, mk, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_single("jaw-crusher", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("jaw-crusher-mk%02d", 2, mk, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("power-house", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("power-house-mk%02d", 2, mk, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("quenching-tower", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_multiple("quenching-tower-mk%02d", 2, mk, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_single("rectisol", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_multiple("rectisol-mk%02d", 2, mk, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_single("solid-separator", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("solid-separator-mk%02d", 2, mk, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("tar-processing-unit", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_multiple("tar-processing-unit-mk%02d", 2, mk, item_sounds.fluid_inventory_move,
    item_sounds.fluid_inventory_pickup, item_sounds.fluid_inventory_move)
add_sound_single("washer", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
add_sound_multiple("washer-mk%02d", 2, mk, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
    item_sounds.fluid_inventory_move)
if not mods.pyalienlife then
    add_sound_single("mukmoux-pasture", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
end
add_sound_single("niobium-mine", item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
    item_sounds.drill_inventory_move)
add_sound_single("co2-absorber", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)
add_sound_multiple("cooling-tower-mk%02d", 1, 2, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
if not mods.pyalienlife then
    add_sound_single("ulric-corral-mk01", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
end
add_sound_single("tailings-pond", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
    item_sounds.metal_large_inventory_move)
add_sound_multiple("gasturbinemk%02d", 1, 3, item_sounds.mechanical_inventory_move,
    item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
add_sound_single("beacon-mk01", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
    item_sounds.mechanical_inventory_move)

-- PyIndustry
if mods.pyindustry then
    add_sound_single("py-tank-1000", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("py-tank-1500", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("py-tank-3000", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("py-tank-4000", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("py-tank-5000", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("py-tank-6500", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("py-tank-7000", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("py-tank-8000", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("barrel-machine-mk01", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("py-check-valve", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_single("py-overflow-valve", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_single("py-underflow-valve", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_single("niobium-pipe", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("niobium-pipe-to-ground", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_multiple("accumulator-mk%02d", 1, 2, item_sounds.electric_large_inventory_move,
        item_sounds.electric_large_inventory_pickup, item_sounds.electric_large_inventory_move)
    for _, building in ipairs({ "shed", "storehouse", "warehouse", "deposit" }) do
        for _, type in ipairs({ "basic", "active-provider", "buffer", "passive-provider", "requester", "storage" }) do
            add_sound_single("py-" .. building .. "-" .. type, item_sounds.metal_large_inventory_move,
                item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
        end
    end
    add_sound_single("py-recharge-station-mk01", item_sounds.electric_large_inventory_move,
        item_sounds.electric_large_inventory_pickup, item_sounds.electric_large_inventory_move)
    add_sound_multiple("py-roboport-mk%02d", 1, 2, item_sounds.roboport_inventory_move,
        item_sounds.roboport_inventory_pickup, item_sounds.roboport_inventory_move)
    add_sound_single("py-ze", item_sounds.roboport_inventory_move, item_sounds.roboport_inventory_pickup,
        item_sounds.roboport_inventory_move)
    add_sound_multiple("py-ze-mk%02d", 2, 4, item_sounds.roboport_inventory_move, item_sounds.roboport_inventory_pickup,
        item_sounds.roboport_inventory_move)
    add_sound_single("py-construction-robot-mk01", item_sounds.robotic_inventory_move,
        item_sounds.robotic_inventory_pickup, item_sounds.robotic_inventory_move)
    add_sound_single("py-logistic-robot-mk01", item_sounds.robotic_inventory_move, item_sounds.robotic_inventory_pickup,
        item_sounds.robotic_inventory_move)
    -- These sounds cannot be added here because these items are implemented during data-updates.
    --add_sound_item("py-aluminium", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    --add_sound_item("py-iron", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    --add_sound_item("py-iron-oxide", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    --add_sound_item("py-limestone", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    --add_sound_item("py-nexelit", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    --add_sound_item("py-steel", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    --add_sound_item("py-coal-tile", item_sounds.concrete_inventory_move, item_sounds.concrete_inventory_pickup, item_sounds.concrete_inventory_move)
    --add_sound_item("py-asphalt", item_sounds.concrete_inventory_move, item_sounds.concrete_inventory_pickup, item_sounds.concrete_inventory_move)
    add_sound_single("mk02-locomotive", item_sounds.locomotive_inventory_move, item_sounds.locomotive_inventory_pickup,
        item_sounds.locomotive_inventory_move)
    add_sound_single("mk02-wagon", item_sounds.metal_large_inventory_move, item_sounds.locomotive_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("mk02-fluid-wagon", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_single("py-burner", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("py-gas-vent", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("py-sinkhole", item_sounds.concrete_inventory_move, item_sounds.concrete_inventory_pickup,
        item_sounds.concrete_inventory_move)
    add_sound_single("concrete-wall", item_sounds.concrete_inventory_move, item_sounds.concrete_inventory_pickup,
        item_sounds.concrete_inventory_move)
    add_sound_single("poorman-wood-fence", item_sounds.wood_inventory_move, item_sounds.wood_inventory_pickup,
        item_sounds.wood_inventory_move)
    add_sound_single("wood-fence", item_sounds.wood_inventory_move, item_sounds.wood_inventory_pickup,
        item_sounds.wood_inventory_move)
    add_sound_single("megadar", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("py-local-radar", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("portable-gasoline-generator", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("personal-fusion-cell", item_sounds.fuel_cell_inventory_move, item_sounds
        .fuel_cell_inventory_pickup, item_sounds.fuel_cell_inventory_move)
    add_sound_single("personal-fusion-cell-used", item_sounds.fuel_cell_inventory_move,
        item_sounds.fuel_cell_inventory_pickup, item_sounds.fuel_cell_inventory_move)
end
-- PyRawOres
if mods.pyrawores then
    add_sound_single("py-construction-robot-mk02", item_sounds.robotic_inventory_move,
        item_sounds.robotic_inventory_pickup, item_sounds.robotic_inventory_pickup)
    add_sound_single("py-logistic-robot-mk02", item_sounds.robotic_inventory_move, item_sounds.robotic_inventory_pickup,
        item_sounds.robotic_inventory_pickup)
    add_sound_multiple("bof-mk%02d", 1, 4, item_sounds.metal_large_inventory_move,
        item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    add_sound_multiple("smelter-mk%02d", 1, 4, item_sounds.metal_large_inventory_move,
        item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    add_sound_multiple("casting-unit-mk%02d", 1, 4, item_sounds.metal_large_inventory_move,
        item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    add_sound_multiple("eaf-mk%02d", 1, 4, item_sounds.electric_large_inventory_move,
        item_sounds.electric_large_inventory_pickup, item_sounds.electric_large_inventory_move)
    add_sound_multiple("electrolyzer-mk%02d", 1, 4, item_sounds.electric_large_inventory_move,
        item_sounds.electric_large_inventory_pickup, item_sounds.electric_large_inventory_move)
    add_sound_multiple("flotation-cell-mk%02d", 1, 4, item_sounds.fluid_inventory_move,
        item_sounds.fluid_inventory_pickup, item_sounds.fluid_inventory_move)
    add_sound_multiple("hydroclassifier-mk%02d", 1, 4, item_sounds.fluid_inventory_move,
        item_sounds.fluid_inventory_pickup, item_sounds.fluid_inventory_move)
    add_sound_multiple("impact-crusher-mk%02d", 1, 4, item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("leaching-station-mk%02d", 1, 4, item_sounds.fluid_inventory_move,
        item_sounds.fluid_inventory_pickup, item_sounds.fluid_inventory_move)
    add_sound_multiple("scrubber-mk%02d", 1, 4, item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("wet-scrubber-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_single("drp", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
        item_sounds.mechanical_inventory_move)
    add_sound_single("sinter-unit", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
        item_sounds.mechanical_inventory_move)
    for _, type in ipairs({ "aluminium", "chromium", "coal", "copper", "iron", "lead", "nexelit", "nickel", "quartz", "salt", "tin", "titanium", "uranium", "zinc" }) do
        add_sound_single(type .. "-mine", item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
            item_sounds.drill_inventory_move)
    end
    add_sound_single("duralumin", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("stainless-steel", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("glass", item_sounds.science_inventory_move, item_sounds.science_inventory_pickup,
        item_sounds.science_inventory_move)
    add_sound_single("super-steel", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    for _, type in ipairs({ "gold", "aluminium", "lead", "nexelit", "nickel", "silver", "tin", "titanium", "zinc" }) do
        add_sound_single(type .. "-plate", item_sounds.metal_small_inventory_move,
            item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    end
    for _, type in ipairs({ "chromite", "copper", "iron", "lead", "nexelit", "nickel", "tin", "ti", "zinc" }) do
        add_sound_single("grade-1-" .. type, item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
            item_sounds.resource_inventory_move)
    end
    for _, type in ipairs({ "chromite", "copper", "iron", "lead", "nexelit", "nickel", "tin", "ti", "zinc" }) do
        add_sound_single("grade-2-" .. type, item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
            item_sounds.resource_inventory_move)
    end
    for _, type in ipairs({ "chromite", "copper", "iron", "lead", "nexelit", "nickel", "tin", "ti", "zinc" }) do
        add_sound_single("grade-3-" .. type, item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
            item_sounds.resource_inventory_move)
    end
    for _, type in ipairs({ "chromite", "copper", "iron", "lead", "nickel", "tin", "ti", "zinc" }) do
        add_sound_single("grade-4-" .. type, item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
            item_sounds.resource_inventory_move)
    end
    for _, type in ipairs({ "iron-dust", "iron", "sl", "tin", "high-tin", "gold" }) do
        add_sound_single(type .. "-concentrate", item_sounds.resource_inventory_move,
            item_sounds.resource_inventory_pickup, item_sounds.resource_inventory_move)
    end
    for _, type in ipairs({ "chromite", "copper", "nexelit", "nickel", "tin-ore", "tin", "ti" }) do
        add_sound_single(type .. "-rejects", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
            item_sounds.resource_inventory_move)
    end
    for _, type in ipairs({ "aluminium", "quartz", "tin", "ti", "zinc" }) do
        add_sound_single("powdered-" .. type, item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
            item_sounds.sulfur_inventory_move)
    end
    for _, type in ipairs({ "alumina", "copper", "iron", "lead", "nexelit", "nickel", "tin", "ti", "zinc", "silver" }) do
        add_sound_single("high-grade-" .. type, item_sounds.metal_small_inventory_move,
            item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    end
    for _, type in ipairs({ "aluminium", "chromium", "copper", "iron", "lead", "nexelit", "nickel", "tin", "ti", "zinc", "silver" }) do
        add_sound_single("sintered-" .. type, item_sounds.metal_small_inventory_move,
            item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
        add_sound_single("reduced-" .. type, item_sounds.metal_small_inventory_move,
            item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    end

    add_sound_single("sodium-aluminate", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("crystalized-sodium-aluminate", item_sounds.resource_inventory_move,
        item_sounds.resource_inventory_pickup, item_sounds.resource_inventory_move)
    add_sound_single("high-chromite", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("processed-chromite", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("raw-coal", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("crushed-coal", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("coarse-coal", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("redhot-coke", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("copper-low-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("low-grade-copper", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("low-grade-rejects", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("processed-iron-ore", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("unslimed-iron", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("iron-ore-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("sponge-iron", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("lead-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("lead-refined-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("lead-refined-dust-02", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("lead-refined-dust-03", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("clean-nexelit", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("fine-nexelit-powder", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("purified-quartz", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("high-grade-quartz", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("tin-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("high-tin-mix", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("ti-enriched-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("ti-residue", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("high-grade-ti-powder", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("concentrated-ti", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("20-u-powder", item_sounds.sulfur_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("40-u-powder", item_sounds.sulfur_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("70-u-powder", item_sounds.sulfur_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("grade-1-u", item_sounds.nuclear_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.nuclear_inventory_move)
    add_sound_single("grade-2-u", item_sounds.nuclear_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.nuclear_inventory_move)
    add_sound_single("powdered-u", item_sounds.sulfur_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("yellow-cake", item_sounds.nuclear_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.nuclear_inventory_move)
    add_sound_single("concentrated-zinc", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("purified-zinc", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("purified-gold", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("gold-precipitate", item_sounds.metal_small_inventory_move, item_sounds
        .metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("gold-precipitate-2", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("solder", item_sounds.wire_inventory_move, item_sounds.wire_inventory_pickup,
        item_sounds.wire_inventory_move)
    add_sound_single("ammonium-chloride", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("aramid", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("p2s5", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("powdered-ralesia-seeds", item_sounds.sulfur_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("pyrite", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("sodium-bisulfate", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("sodium-carbonate", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("sodium-hydroxide", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("sodium-sulfate", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("starch", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("tinned-cable", item_sounds.wire_inventory_move, item_sounds.wire_inventory_pickup,
        item_sounds.wire_inventory_move)
    add_sound_multiple("fuelrod-mk%02d", 2, 5, item_sounds.nuclear_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.nuclear_inventory_move)
    add_sound_multiple("uranium-fuel-cell-mk%02d", 2, 5, item_sounds.nuclear_inventory_move,
        item_sounds.nuclear_inventory_pickup, item_sounds.nuclear_inventory_move)
    add_sound_multiple("used-up-uranium-fuel-cell-mk%02d", 2, 5, item_sounds.nuclear_inventory_move,
        item_sounds.nuclear_inventory_pickup, item_sounds.nuclear_inventory_move)
    add_sound_single("mega-drill-head", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("salt", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    for _, type in ipairs({ "aluminium", "chromium", "lead", "nickel", "quartz", "tin", "titanium", "zinc" }) do
        add_sound_single("ore-" .. type, item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
            item_sounds.resource_inventory_move)
    end
end
-- PyFusionEnergy
if mods.pyfusionenergy then
    add_sound_multiple("agitator-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_multiple("nmf-mk%02d", 1, 4, item_sounds.mechanical_inventory_move, item_sounds
        .mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("secondary-crusher-mk%02d", 1, 4, item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("thickener-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_multiple("xyhiphoe-pool-mk%02d", 1, 1, item_sounds.fluid_inventory_move, item_sounds
        .fluid_inventory_pickup, item_sounds.fluid_inventory_move)
    add_sound_multiple("gas-separator-mk%02d", 1, 4, item_sounds.steam_inventory_move, item_sounds
        .steam_inventory_pickup, item_sounds.steam_inventory_move)
    add_sound_multiple("hydrocyclone-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_multiple("vacuum-pump-mk%02d", 1, 4, item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("automated-screener-mk%02d", 1, 4, item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("centrifugal-pan-mk%02d", 1, 4, item_sounds.fluid_inventory_move,
        item_sounds.fluid_inventory_pickup, item_sounds.fluid_inventory_move)
    add_sound_multiple("compressor-mk%02d", 1, 4, item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("genlab-mk%02d", 1, 1, item_sounds.metal_large_inventory_move,
        item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    add_sound_multiple("jig-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_multiple("kmauts-enclosure-mk%02d", 1, 1, item_sounds.metal_large_inventory_move,
        item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    add_sound_multiple("grease-table-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_multiple("mixer-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_single("py-heat-exchanger", item_sounds.steam_inventory_move, item_sounds.steam_inventory_pickup,
        item_sounds.steam_inventory_move)
    for _, type in ipairs({ "diamond", "mo", "regolite" }) do
        add_sound_single(type .. "-mine", item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
            item_sounds.drill_inventory_move)
    end
    add_sound_single("plankton-farm", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_multiple("plankton-farm-mk%02d", 2, 4, item_sounds.fluid_inventory_move, item_sounds
        .fluid_inventory_pickup, item_sounds.fluid_inventory_move)
    add_sound_single("bio-reactor-mk01", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_single("fusion-reactor-mk01", item_sounds.reactor_inventory_move, item_sounds.reactor_inventory_pickup,
        item_sounds.reactor_inventory_move)
    add_sound_single("fusion-reactor-mk02", item_sounds.reactor_inventory_move, item_sounds.reactor_inventory_pickup,
        item_sounds.reactor_inventory_move)
    add_sound_single("py-turbine", item_sounds.steam_inventory_move, item_sounds.steam_inventory_pickup,
        item_sounds.steam_inventory_move)
    add_sound_single("calcium-carbide", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("crushed-kimberlite", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("diamond-reject", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("kimberlite-grade2", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("kimberlite-grade3", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("kimberlite-rejects", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("kimberlite-residue", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("kimberlite-rock", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("molybdenum-ore", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("processed-rejects", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("pure-kimberlite-grade2", item_sounds.resource_inventory_move, item_sounds
        .resource_inventory_pickup, item_sounds.resource_inventory_move)
    add_sound_single("regolite-rock", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("crushed-molybdenite", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("molybdenite-dust", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("molybdenum-concentrate", item_sounds.resource_inventory_move, item_sounds
        .resource_inventory_pickup, item_sounds.resource_inventory_move)
    add_sound_single("molybdenum-sulfide", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("molybdenum-oxide", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("molybdenum-plate", item_sounds.metal_small_inventory_move, item_sounds
        .metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("sodium-chlorate", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("vanadium-oxide", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("super-alloy", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("calcinates", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("crude-diamond", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("diamond", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("serine", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("washed-diamond", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("crushed-regolite", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("kmauts-ration", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("methyl-acrylate", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("powdered-regolite", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("regolite-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("agzn-alloy", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("b2o3-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("blanket", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("blanket-chassi", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("boron", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("boron-carbide", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("boron-mixture", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("coated-container", item_sounds.metal_large_inventory_move, item_sounds
        .metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    add_sound_single("coil-core", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("control-unit", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("deposited-core", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("divertor", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("ferrite", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("lead-container", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("magnetic-core", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("nenbit-matrix", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("nexelit-matrix", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("nuclear-sample", item_sounds.nuclear_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.nuclear_inventory_move)
    add_sound_single("reinforced-wall-shield", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("sc-coil", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("sc-unit", item_sounds.electric_small_inventory_move, item_sounds.electric_small_inventory_pickup,
        item_sounds.electric_small_inventory_move)
    add_sound_single("sc-wire", item_sounds.wire_inventory_move, item_sounds.wire_inventory_pickup,
        item_sounds.wire_inventory_move)
    add_sound_single("science-coating", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("silver-foam", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("wall-shield", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("used-up-mox-fuel-cell", item_sounds.nuclear_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.nuclear_inventory_move)
    add_sound_single("mox-fuel-cell", item_sounds.nuclear_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.nuclear_inventory_move)
    add_sound_single("plutonium", item_sounds.nuclear_inventory_move, item_sounds.nuclear_inventory_pickup,
        item_sounds.nuclear_inventory_move)
    add_sound_single("nbti-alloy", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
end
-- PyPetroleumHandling
if mods.pypetroleumhandling then
    add_sound_single("py-tank-9000", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("py-tank-10000", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_multiple("natural-gas-derrick-mk%02d", 1, 4, item_sounds.pumpjack_inventory_move,
        item_sounds.pumpjack_inventory_pickup, item_sounds.pumpjack_inventory_move)
    add_sound_multiple("oil-derrick-mk%02d", 1, 4, item_sounds.pumpjack_inventory_move,
        item_sounds.pumpjack_inventory_pickup, item_sounds.pumpjack_inventory_move)
    add_sound_multiple("oil-sand-extractor-mk%02d", 1, 4, item_sounds.drill_inventory_move,
        item_sounds.drill_inventory_pickup, item_sounds.drill_inventory_move)
    add_sound_multiple("tar-extractor-mk%02d", 1, 4, item_sounds.pumpjack_inventory_move,
        item_sounds.pumpjack_inventory_pickup, item_sounds.pumpjack_inventory_move)
    add_sound_multiple("coalbed-mk%02d", 1, 4, item_sounds.pumpjack_inventory_move, item_sounds
        .pumpjack_inventory_pickup, item_sounds.pumpjack_inventory_move)
    add_sound_multiple("cracker-mk%02d", 1, 4, item_sounds.steam_inventory_move, item_sounds.steam_inventory_pickup,
        item_sounds.steam_inventory_move)
    add_sound_multiple("gas-refinery-mk%02d", 1, 4, item_sounds.steam_inventory_move, item_sounds.steam_inventory_pickup,
        item_sounds.steam_inventory_move)
    add_sound_multiple("heavy-oil-refinery-mk%02d", 1, 4, item_sounds.fluid_inventory_move,
        item_sounds.fluid_inventory_pickup, item_sounds.fluid_inventory_move)
    add_sound_multiple("lor-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_multiple("pumpjack-mk%02d", 1, 4, item_sounds.pumpjack_inventory_move,
        item_sounds.pumpjack_inventory_pickup, item_sounds.pumpjack_inventory_move)
    add_sound_multiple("reformer-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_multiple("tholin-atm-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_multiple("tholin-plant-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_multiple("upgrader-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_single("sulfur-mine", item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
        item_sounds.drill_inventory_move)
    add_sound_single("fracking-rig", item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
        item_sounds.drill_inventory_move)
    add_sound_single("guar-gum-plantation", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("guar-gum-plantation-mk%02d", 2, 4, item_sounds.fluid_inventory_move,
        item_sounds.fluid_inventory_pickup, item_sounds.fluid_inventory_move)
    add_sound_single("oil-boiler-mk01", item_sounds.steam_inventory_move, item_sounds.steam_inventory_pickup,
        item_sounds.steam_inventory_move)
    add_sound_single("retorter", item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
        item_sounds.drill_inventory_move)
    add_sound_single("rhe", item_sounds.steam_inventory_move, item_sounds.steam_inventory_pickup,
        item_sounds.steam_inventory_move)
    add_sound_single("crushed-oil-sand", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("belt", item_sounds.wire_inventory_move, item_sounds.wire_inventory_pickup,
        item_sounds.wire_inventory_move)
    add_sound_single("bolts", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("carbon-black", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("guar", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("guar-gum", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("guar-seeds", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("hot-stone-brick", item_sounds.brick_inventory_move, item_sounds.brick_inventory_pickup,
        item_sounds.brick_inventory_move)
    add_sound_single("kerogen", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("rubber", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("small-parts-01", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("small-parts-02", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("small-parts-03", item_sounds.plastic_inventory_move, item_sounds.plastic_inventory_pickup,
        item_sounds.plastic_inventory_move)
    add_sound_single("sncr-alloy", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("soot", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("ticl4", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("warm-stone-brick", item_sounds.brick_inventory_move, item_sounds.brick_inventory_pickup,
        item_sounds.brick_inventory_move)
    add_sound_single("warmer-stone-brick", item_sounds.brick_inventory_move, item_sounds.brick_inventory_pickup,
        item_sounds.brick_inventory_move)
    add_sound_single("empty-proto-tholins-vessel", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("filled-proto-tholins-vessel", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("filled-tholins-vessel", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("capsule", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("oil-sand", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
end

-- PyHighTech
if mods.pyhightech then
    add_sound_single("ht-pipes", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("ht-pipes-to-ground", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("py-roboport-mk03", item_sounds.roboport_inventory_move, item_sounds.roboport_inventory_pickup,
        item_sounds.roboport_inventory_pickup)
    add_sound_single("py-construction-robot-mk04", item_sounds.robotic_inventory_move,
        item_sounds.robotic_inventory_pickup, item_sounds.robotic_inventory_pickup)
    add_sound_single("py-logistic-robot-mk04", item_sounds.robotic_inventory_move, item_sounds.robotic_inventory_pickup,
        item_sounds.robotic_inventory_pickup)
    add_sound_single("ht-locomotive", item_sounds.electric_large_inventory_move, item_sounds.locomotive_inventory_pickup,
        item_sounds.electric_large_inventory_move)
    add_sound_single("ht-generic-wagon", item_sounds.metal_large_inventory_move, item_sounds.locomotive_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("ht-generic-fluid-wagon", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_single("utility-science-pack", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("bose-einstein-superfluid", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("nv-center", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
        item_sounds.mechanical_inventory_move)
    add_sound_single("pi-josephson-junction", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("quantum-dots", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("quantum-vortex-storage-system", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("var-josephson-junction", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("nexelit-battery", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("used-nexelit-battery", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_multiple("clay-pit-mk%02d", 1, 4, item_sounds.steam_inventory_move, item_sounds.steam_inventory_pickup,
        item_sounds.steam_inventory_move)
    add_sound_multiple("chipshooter-mk%02d", 1, 4, item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("pcb-factory-mk%02d", 1, 4, item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("fbreactor-mk%02d", 1, 4, item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_multiple("particle-accelerator-mk%02d", 1, 4, item_sounds.reactor_inventory_move,
        item_sounds.reactor_inventory_pickup, item_sounds.reactor_inventory_move)
    add_sound_multiple("electronics-factory-mk%02d", 1, 4, item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("pulp-mill-mk%02d", 1, 4, item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_multiple("nano-assembler-mk%02d", 1, 4, item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("phosphate-mine", item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
        item_sounds.drill_inventory_move)
    add_sound_single("rare-earth-mine", item_sounds.drill_inventory_move, item_sounds.drill_inventory_pickup,
        item_sounds.drill_inventory_move)
    add_sound_single("cadaveric-arum-mk01", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("kicalk-plantation", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
        item_sounds.mechanical_inventory_move)
    add_sound_single("moondrop-greenhouse-mk01", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("zipir", item_sounds.fluid_inventory_move, item_sounds.fluid_inventory_pickup,
        item_sounds.fluid_inventory_move)
    add_sound_single("auog-paddock", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
        item_sounds.mechanical_inventory_move)
    add_sound_single("quantum-computer", item_sounds.electric_large_inventory_move,
        item_sounds.electric_large_inventory_pickup, item_sounds.electric_large_inventory_move)
    add_sound_single("clay", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("re-magnet", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("bisphenol-a", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("epoxy", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("glass-fiber", item_sounds.wire_inventory_move, item_sounds.wire_inventory_pickup,
        item_sounds.wire_inventory_move)
    add_sound_single("melamine", item_sounds.wood_inventory_move, item_sounds.wood_inventory_pickup,
        item_sounds.wood_inventory_move)
    add_sound_single("melamine-resin", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("pdms", item_sounds.metal_barrel_inventory_move, item_sounds.metal_barrel_inventory_pickup,
        item_sounds.metal_barrel_inventory_move)
    add_sound_single("phosphate-glass", item_sounds.science_inventory_move, item_sounds.science_inventory_pickup,
        item_sounds.science_inventory_move)
    add_sound_single("silicon", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("stone-wool", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("ceramic", item_sounds.brick_inventory_move, item_sounds.brick_inventory_pickup,
        item_sounds.brick_inventory_move)
    add_sound_single("graphene-roll", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("graphene-sheet", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("nic-core", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("pdms-graphene", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("graphite", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("biopolymer", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("carbon-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("colloidal-silica", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("crco-alloy", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("crystallographic-substrate", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("lithium-chloride", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("ndfeb-alloy", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("ndfeb-powder", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("powdered-phosphate-rock", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("proton-donor", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("proton-receiver", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("silica-powder", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("sodium-silicate", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("zinc-acetate", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("zinc-nanocomplex", item_sounds.metal_small_inventory_move, item_sounds
        .metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("zinc-nanocompound", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("zno-nanoparticles", item_sounds.metal_large_inventory_move,
        item_sounds.metal_large_inventory_pickup, item_sounds.metal_large_inventory_move)
    add_sound_single("silicon-wafer", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("heavy-n", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("heavy-p-type", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("light-n", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("p-dope", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("cermet", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("crude-cermet", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("bakelite", item_sounds.plastic_inventory_move, item_sounds.plastic_inventory_pickup,
        item_sounds.plastic_inventory_move)
    add_sound_single("fecr-alloy", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("phenol", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("dry-ralesia", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("ralesia-powder", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("raw-fiber", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("fiber", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("micro-fiber", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("rayon", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("sub-denier-microfiber", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("urea", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("zipir-carcass", item_sounds.raw_fish_inventory_move, item_sounds.raw_fish_inventory_pickup,
        item_sounds.raw_fish_inventory_move)
    add_sound_single("blood-meal", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("bones", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("collagen", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("fertilizer", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("meat", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("myoglobin", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("resilin", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("skin", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("nylon", item_sounds.plastic_inventory_move, item_sounds.plastic_inventory_pickup,
        item_sounds.plastic_inventory_move)
    add_sound_single("nylon-parts", item_sounds.plastic_inventory_move, item_sounds.plastic_inventory_pickup,
        item_sounds.plastic_inventory_move)
    add_sound_single("aerogel", item_sounds.solid_fuel_inventory_move, item_sounds.solid_fuel_inventory_pickup,
        item_sounds.solid_fuel_inventory_move)
    add_sound_single("carbon-aerogel", item_sounds.solid_fuel_inventory_move, item_sounds.solid_fuel_inventory_pickup,
        item_sounds.solid_fuel_inventory_move)
    add_sound_single("clean-rf-gel", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("resorcinol", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("rf-gel", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("supercapacitor-core", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("volumetric-capacitor", item_sounds.mechanical_inventory_move,
        item_sounds.mechanical_inventory_pickup, item_sounds.mechanical_inventory_move)
    add_sound_single("phosphate-rock", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("electronic-circuit", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_multiple("capacitor%d", 1, 3, item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_multiple("inductor%d", 1, 3, item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_multiple("resistor%d", 1, 3, item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_multiple("pcb%d", 1, 4, item_sounds.wood_inventory_move, item_sounds.wood_inventory_pickup,
        item_sounds.wood_inventory_move)
    add_sound_single("vacuum-tube", item_sounds.science_inventory_move, item_sounds.science_inventory_pickup,
        item_sounds.science_inventory_move)
    add_sound_single("fiberboard", item_sounds.wood_inventory_move, item_sounds.wood_inventory_pickup,
        item_sounds.wood_inventory_move)
    add_sound_single("formica", item_sounds.wood_inventory_move, item_sounds.wood_inventory_pickup,
        item_sounds.wood_inventory_move)
    add_sound_single("advanced-circuit", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("diode", item_sounds.electric_small_inventory_move, item_sounds.electric_small_inventory_pickup,
        item_sounds.electric_small_inventory_move)
    add_sound_single("microchip", item_sounds.electric_small_inventory_move, item_sounds.electric_small_inventory_pickup,
        item_sounds.electric_small_inventory_move)
    add_sound_single("transistor", item_sounds.electric_small_inventory_move, item_sounds
        .electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("phenolicboard", item_sounds.wood_inventory_move, item_sounds.wood_inventory_pickup,
        item_sounds.wood_inventory_move)
    add_sound_single("processing-unit", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("diode3", item_sounds.electric_small_inventory_move, item_sounds.electric_small_inventory_pickup,
        item_sounds.electric_small_inventory_move)
    add_sound_single("pcb3-2", item_sounds.electric_small_inventory_move, item_sounds.electric_small_inventory_pickup,
        item_sounds.electric_small_inventory_move)
    add_sound_single("processor", item_sounds.electric_small_inventory_move, item_sounds.electric_small_inventory_pickup,
        item_sounds.electric_small_inventory_move)
    add_sound_single("fiberglass", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("high-flux-core", item_sounds.metal_large_inventory_move, item_sounds.metal_large_inventory_pickup,
        item_sounds.metal_large_inventory_move)
    add_sound_single("processor-core", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("sc-substrate", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
        item_sounds.mechanical_inventory_move)
    add_sound_single("superconductor", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("capacitor-core", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("capacitor-termination", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("diode-core", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("hyperelastic-material", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("intelligent-unit", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("csle-diode", item_sounds.electric_small_inventory_move, item_sounds
        .electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("fault-current-inductor", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("kondo-processor", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("nanochip", item_sounds.electric_small_inventory_move, item_sounds.electric_small_inventory_pickup,
        item_sounds.electric_small_inventory_move)
    add_sound_single("paradiamatic-resistor", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("supercapacitor", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("carbon-nanotube", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("heavy-fermion", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("kondo-core", item_sounds.electric_small_inventory_move, item_sounds
        .electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("kondo-substrate", item_sounds.wood_inventory_move, item_sounds.wood_inventory_pickup,
        item_sounds.wood_inventory_move)
    add_sound_single("laser-module", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("nano-wires", item_sounds.wire_inventory_move, item_sounds.wire_inventory_pickup,
        item_sounds.wire_inventory_move)
    add_sound_single("nanocrystaline-core", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("nems", item_sounds.science_inventory_move, item_sounds.science_inventory_pickup,
        item_sounds.science_inventory_move)
    add_sound_single("nxag-matrix", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
    add_sound_single("paramagnetic-material", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("parametric-oscilator", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("supercapacitor-shell", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("yag-laser-module", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("antimatter", item_sounds.mechanical_inventory_move, item_sounds.mechanical_inventory_pickup,
        item_sounds.mechanical_inventory_move)
    add_sound_single("diamagnetic-material", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("harmonic-absorber", item_sounds.metal_small_inventory_move,
        item_sounds.metal_small_inventory_pickup, item_sounds.metal_small_inventory_move)
    add_sound_single("pyrolytic-carbon", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("superconductor-servomechanims", item_sounds.electric_small_inventory_move,
        item_sounds.electric_small_inventory_pickup, item_sounds.electric_small_inventory_move)
    add_sound_single("lithium-niobate", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("rare-earth-ore", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("rare-earth-powder", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("rare-earth-dust", item_sounds.sulfur_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.sulfur_inventory_move)
    add_sound_single("ree-concentrate", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("reo", item_sounds.resource_inventory_move, item_sounds.resource_inventory_pickup,
        item_sounds.resource_inventory_move)
    add_sound_single("re-tin", item_sounds.metal_small_inventory_move, item_sounds.metal_small_inventory_pickup,
        item_sounds.metal_small_inventory_move)
end
