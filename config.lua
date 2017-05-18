local PYC = {} --Do not change
PYC.TAILINGS_POND = {} -- Do not change
PYC.control = {}

--Messages and stuff for developers
--These should be false in a release.
PYC.DEBUG = true
PYC.control.loglevel = 2

--Changes some vanilla/mod recipes to use Creosate
--USE_CREOSOTE_RECIPES, if false will disable use of creosote in vanilla recipes. if true
--then any recipes that are true in USE_CREOSOTE_IN will use creosote.
PYC.USE_CREOSOTE_RECIPES = true
PYC.USE_CREOSOTE_IN = {
    --Rail tracks
    rail = true,
    --Medium power pole, big wooden power pole
    power_poles = true,
}

--Tank size, how much of a fluid the tank can hold
PYC.TAILINGS_POND.TANK_SIZE = 100000 --default 10000

--Does gas entering the tailings pond cause pollution when vented
--default=.15 off=0
PYC.TAILINGS_POND.GAS_POLLUTE_MODIFIER = .15

--Tailings ponds that contain non clean water liquids pollute the ground they are on
--chance is a percentage from 1 to 100, set to 0 to disable.
--ticks is the number of ticks that must pass with a full tank before another check is done.
PYC.TAILINGS_POND.SCORCH_CHANCE = 3 --default 3
PYC.TAILINGS_POND.SCORCH_TICKS = 36000 --default: 36000 (this will check every 10 minutes)

--List of Gas fluids, true values cause pollution when vented, all gasses with gas in the name fall under this category
PYC.TAILINGS_POND.GAS = {
    ["chlorine"] = true,
    ["hydrogen-chloride"] = true,
    ["sulfur-dioxide"] = true,
    ["oxygen"] = false,
    ["hydrogen"] = false,
    ["carbon-dioxide"] = false,
    ["nitrogen"] = false,
    ["nitrogen-dioxide"] = false,
    ["wind"] = false,
}

PYC.quickstart = {
    mod_name = "pyCoal",
    clear_items = true,
    power_armor = "power-armor-mk2",
    equipment = {
        "creative-mode_super-fusion-reactor-equipment",
        "personal-roboport-mk2-equipment",
        "belt-immunity-equipment"
    },
    starter_tracks = true,
    destroy_everything = true,
    disable_rso_starting = true,
    disable_rso_chunk = true,
    floor_tile = "lab-dark-1",
    floor_tile_alt = "lab-dark-2",
    make_train = true,
    area_box = {{-250, -250}, {250, 250}},
    chunk_bounds = true,
    center_map_tag = true,
    setup_power = true,
    stacks = {
        "creative-mode_fluid-source",
        "creative-mode_matter-source",
        "creative-mode_passive-energy-void",
        "creative-mode_super-substation",
        "creative-mode_energy-source"
    },
}

return PYC
