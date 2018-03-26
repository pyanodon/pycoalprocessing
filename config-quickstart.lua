-- Settings used for the quickstart script,
-- if an item doesn't exist it is ignored.
return {
    cheat_mode = true,
    always_day = true,
    clear_items = true,
    power_armor = 'power-armor-mk2',
    equipment = {
        'creative-mode_super-fusion-reactor-equipment',
        'fusion-reactor-equipment',
        'personal-roboport-mk2-equipment',
        'belt-immunity-equipment'
    },
    starter_tracks = true,
    destroy_everything = true,
    disable_rso_starting = true,
    disable_rso_chunk = true,
    floor_tile = 'lab-dark-1',
    floor_tile_alt = 'lab-dark-2',
    ore_patches = true,
    make_train = true,
    area_box = {{-250, -250}, {250, 250}},
    chunk_bounds = true,
    center_map_tag = true,
    setup_power = true,
    stacks = {
        'construction-robot',
        'assembling-machine-3',
        'pipe',
        'fast-inserter'
    },
    quickbar = {
        'creative-mode_item-source',
        'creative-mode_fluid-source',
        'creative-mode_energy-source',
        'creative-mode_super-substation',
        'creative-mode_magic-wand-modifier',
        'creative-mode_super-roboport',
        'infinity-chest'
    }
}
