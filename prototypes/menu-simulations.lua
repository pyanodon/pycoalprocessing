if not mods["pyindustry"] then
    return
end

local menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations

-- do not work
menu_simulations.nauvis_burner_city = nil
menu_simulations.nauvis_early_smelting = nil
menu_simulations.nauvis_mining_defense = nil
menu_simulations.nauvis_lab = nil
menu_simulations.nauvis_oil_refinery = nil
menu_simulations.nauvis_uranium_processing = nil
menu_simulations.nauvis_ship_rails = nil

-- work, but use the old bots
menu_simulations.nauvis_logistic_robots = nil
menu_simulations.nauvis_solar_power_construction = nil
menu_simulations.nauvis_spider_ponds = nil
menu_simulations.nauvis_artillery = nil   -- also involves biters/military
menu_simulations.nauvis_big_defense = nil -- also involves biters/military

-- work, but are not really what Py is like/are kind of boring
menu_simulations.nauvis_biter_base_artillery = nil
menu_simulations.nauvis_biter_base_laser_defense = nil -- breaks with PyAE
menu_simulations.nauvis_biter_base_player_attack = nil
menu_simulations.nauvis_biter_base_spidertron = nil
menu_simulations.nauvis_biter_base_steamrolled = nil
menu_simulations.nauvis_chase_player = nil
menu_simulations.nauvis_brutal_defeat = nil
menu_simulations.nauvis_forest_fire = nil

if mods["pyhightech"] or mods["pyrawores"] or mods["pypetroleumhandling"] then
    -- work, but involves biters/military
    menu_simulations.artillery = nil
    menu_simulations.big_defense = nil
    menu_simulations.nauvis_train_junction = nil -- uses artillery wagon...
    menu_simulations.nauvis_train_station = nil  -- uses artillery wagon...

    menu_simulations.nauvis_nuclear_power = nil  -- does not involve biters, but PyHT makes it weird and PyHT + PyRO breaks it
    menu_simulations.nauvis_oil_pumpjacks = nil  -- does not involve biters, but makes no sense with PyPH
end

menu_simulations.cp_unload =
{
    checkboard = false,
    save = "__pycoalprocessinggraphics__/menu-simulations/menu-simulation-cp-unload.zip",
    length = 60 * 20,
    init =
    [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
    update =
    [[
  ]]
}

menu_simulations.cp_forest =
{
    checkboard = false,
    save = "__pycoalprocessinggraphics__/menu-simulations/menu-simulation-cp-forest.zip",
    length = 60 * 20,
    init =
    [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end

    local inventory = game.create_inventory(1)
    inventory[1].import_stack("0eNpdjDEKgDAMAP+SWQeLUu1nitQgRU0liYJI/24dXNyOg7sbJgyJRPkIGhP5fR2JkMHdIKgaaZaXlRHFjzR5TmERn2i9wJUKcwVRcQP3O9XfqYITWYoBZ/qmtYOx1rR915icHxQoLaE=")

    local tickCount = 0
    script.on_event(defines.events.on_tick, function()
      tickCount = tickCount + 1
      if tickCount == 60 * 3 then
        inventory[1].deconstruct_area{surface=surface, force="player", area={{174, -42}, {205, -14}}}
      end
      if tickCount == 60 * 10 then
        inventory[1].deconstruct_area{surface=surface, force="player", area={{174, -42}, {305, 114}}}
      end
    end)
  ]],
    update =
    [[
  ]]
}

menu_simulations.cp_borax =
{
    checkboard = false,
    save = "__pycoalprocessinggraphics__/menu-simulations/menu-simulation-cp-borax.zip",
    length = 60 * 20,
    init =
    [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
    update =
    [[
  ]]
}

menu_simulations.in_bots =
{
    checkboard = false,
    save = "__pyindustrygraphics__/menu-simulations/menu-simulation-in-bots.zip",
    length = 60 * 20,
    init =
    [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
    update =
    [[
  ]]
}
menu_simulations.in_bus =
{
    checkboard = false,
    save = "__pyindustrygraphics__/menu-simulations/menu-simulation-in-bus.zip",
    length = 60 * 20,
    init =
    [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
    update =
    [[
  ]]
}

if mods["pyfusionenergy"] then
    menu_simulations.fe_diamonds =
    {
        checkboard = false,
        save = "__pyfusionenergygraphics__/menu-simulations/menu-simulation-fe-diamonds.zip",
        length = 60 * 20,
        init =
        [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
        update =
        [[
  ]]
    }
    local has_alternative_energy = mods["pyalternativeenergy"]
    menu_simulations.fe_reactors =
    {
        checkboard = false,
        save = has_alternative_energy and
            "__pyalternativeenergygraphics__/menu-simulations/menu-simulation-fe-reactors2.zip" or
            "__pyfusionenergygraphics__/menu-simulations/menu-simulation-fe-reactors.zip",
        length = 60 * 20,
        init =
        [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
        update =
        [[
  ]]
    }
end

if mods["pyhightech"] then
    menu_simulations.ht_ores =
    {
        checkboard = false,
        save = "__pyhightechgraphics__/menu-simulations/menu-simulation-ht-ores.zip",
        length = 60 * 20,
        init =
        [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
        update =
        [[
  ]]
    }
    if mods["pyrawores"] then
        menu_simulations.ht_pa =
        {
            checkboard = false,
            save = "__pyhightechgraphics__/menu-simulations/menu-simulation-ht-pa2.zip",
            length = 60 * 20,
            init =
            [[
      local surface = game.surfaces.nauvis
      local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
      game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
      game.simulation.camera_zoom = 1
      game.tick_paused = false

      for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
          entity.destroy()
      end

      local character = surface.create_entity{name = "character", position = {29.5, -25.5}, force = "player"}
      character.walking_state = {walking = true, direction = defines.direction.south}

      script.on_nth_tick(1, function()
        if character.position.y < 11 then return end
        character.walking_state = {walking = true, direction = defines.direction.west}

        script.on_nth_tick(10, nil)
      end)
    ]],
            update =
            [[
    ]]
        }
    end
    local does_not_work_due_to_batteries = mods["pyalienlife"] and not mods["pyalternativeenergy"]
    if not does_not_work_due_to_batteries then
        menu_simulations.ht_chips =
        {
            checkboard = false,
            save = "__pyhightechgraphics__/menu-simulations/menu-simulation-ht-chips2.zip",
            length = 60 * 20,
            init =
            [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
            update =
            [[
  ]]
        }
    end
end

if mods["pyrawores"] then
    if mods["pyfusionenergy"] then   -- without PyFE, a lot of buildings are different, so it's impossible to showcase an (almost) full chain
        menu_simulations.ro_chain =
        {
            checkboard = false,
            save = "__pyraworesgraphics__/menu-simulations/menu-simulation-ro-chain.zip",
            length = 60 * 20,
            init =
            [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
            update =
            [[
  ]]
        }
    end

    local has_fusion_energy = mods["pyfusionenergy"]
    menu_simulations.ro_mines =
    {
        checkboard = false,
        save = "__pyraworesgraphics__/menu-simulations/menu-simulation-ro-mines.zip",
        length = 60 * 20,
        init =
            string.format([[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end

    local pipe = surface.find_entities_filtered{name = "infinity-pipe", limit = 1}[1]
    pipe.set_infinity_pipe_filter({ name = "%s", percentage=0.5, temperature=100, mode="exactly" })
  ]], has_fusion_energy and "acetylene" or "diesel"), -- PyFE makes the crystal mine take acetylene instead of diesel
        update =
        [[
  ]]
    }

    local mold_exists = mods["pyalienlife"]
    menu_simulations.ro_cast =
    {
        checkboard = false,
        save = "__pyraworesgraphics__/menu-simulations/menu-simulation-ro-cast.zip",
        length = 60 * 20,
        init =
            string.format([[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end

    local box = surface.find_entities_filtered{name = "steel-chest", limit = 1}[1]
    box.insert{name="%s", count=4800}
  ]], mold_exists and "mold" or "sand-casting"),
        update =
        [[
  ]]
    }
end

if mods["pypetroleumhandling"] then
    menu_simulations.ph_shale =
    {
        checkboard = false,
        save = "__pypetroleumhandlinggraphics__/menu-simulations/menu-simulation-ph-shale.zip",
        length = 60 * 20,
        init =
        [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
        update =
        [[
  ]]
    }
    menu_simulations.ph_seeps =
    {
        checkboard = false,
        save = "__pypetroleumhandlinggraphics__/menu-simulations/menu-simulation-ph-seeps.zip",
        length = 60 * 20,
        init =
        [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end

    local mixer = surface.find_entities_filtered{name = "mixer-mk01", limit = 1}[1]
    if #(mixer.get_recipe().ingredients) > 3 then -- in PyHT, the recipe gains clay as ingredient
      local box = surface.find_entities_filtered{name = "steel-chest", limit = 1}[1]
      box.insert{name="clay", count=1000}
    end
  ]],
        update =
        [[
  ]]
    }
    menu_simulations.ph_drills =
    {
        checkboard = false,
        save = "__pypetroleumhandlinggraphics__/menu-simulations/menu-simulation-ph-drills.zip",
        length = 60 * 20,
        init =
        [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
        update =
        [[
  ]]
    }
end

if mods["pyalienlife"] then
    menu_simulations.al_early =
    {
        checkboard = false,
        save = "__pyalienlifegraphics__/menu-simulations/menu-simulation-al-early.zip",
        length = 60 * 20,
        init =
        [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
        update =
        [[
  ]]
    }

    if mods["pyhightech"] then   -- no cardaveric arum without HT
        menu_simulations.al_spaghetti =
        {
            checkboard = false,
            save = "__pyalienlifegraphics__/menu-simulations/menu-simulation-al-spaghetti.zip",
            length = 60 * 20,
            init =
            [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+9.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
            update =
            [[
  ]]
        }
    end

    if mods["pyhightech"] then   -- no antelopes without HT
        menu_simulations.al_late =
        {
            checkboard = false,
            save = "__pyalienlifegraphics__/menu-simulations/menu-simulation-al-late.zip",
            length = 60 * 22,
            init =
            [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end

    local y = game.simulation.camera_position.y + 17
    local x = game.simulation.camera_position.x - 40
    local character = surface.create_entity{ name = "character", position = {x, y}, force = "player" }
    character.color = {1, 0, 0, 0.5}
    local car = surface.create_entity{ name = "dingrido", position = {x, y}, force = "player" }
    car.orientation = 0.25
    car.insert{name = "meat", count = 50}
    character.riding_state = { acceleration = defines.riding.acceleration.nothing, direction = defines.riding.direction.straight }

    local tickCount = 0
    script.on_nth_tick(1,
        function()
            tickCount = tickCount + 1
            if tickCount == 60 * 5 then
                car.set_driver(character)
                character.riding_state = { acceleration = defines.riding.acceleration.accelerating, direction = defines.riding.direction.straight }
            end
        end)
  ]],
            update =
            [[
  ]]
        }
    end
end

if mods["pyalternativeenergy"] then
    menu_simulations.ae_early =
    {
        checkboard = false,
        save = "__pyalternativeenergygraphics__/menu-simulations/menu-simulation-ae-early.zip",
        length = 60 * 15,
        init =
        [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+9.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end

    local y = game.simulation.camera_position.y + 8
    local x = game.simulation.camera_position.x + 40
    local character = surface.create_entity{ name = "character", position = {x, y}, force = "player" }
    character.color = {1, 0, 0, 0.5}
    local car = surface.create_entity{ name = "car", position = {x, y}, force = "player" }
    car.orientation = 0.755
    car.insert{name = "wood", count = 50}
    car.speed = 0.5
    character.riding_state = { acceleration = defines.riding.acceleration.nothing, direction = defines.riding.direction.straight }

    local tickCount = 0
    script.on_nth_tick(1,
        function()
            tickCount = tickCount + 1
            if tickCount == 60 * 2 then
                car.set_driver(character)
                character.riding_state = { acceleration = defines.riding.acceleration.accelerating, direction = defines.riding.direction.straight }
            end
            if tickCount == 60 * 5.7 then
                character.riding_state = { acceleration = defines.riding.acceleration.braking, direction = defines.riding.direction.straight }
            end
            if tickCount == 60 * 8 then
                character.riding_state = { acceleration = defines.riding.acceleration.reversing, direction = defines.riding.direction.straight }
            end
            if tickCount == 60 * 8.5 then
                character.riding_state = { acceleration = defines.riding.acceleration.braking, direction = defines.riding.direction.straight }
            end
            if tickCount == 60 * 9 then
                character.riding_state = { acceleration = defines.riding.acceleration.accelerating, direction = defines.riding.direction.left }
            end
            if tickCount == 60 * 9.25 then
                character.riding_state = { acceleration = defines.riding.acceleration.accelerating, direction = defines.riding.direction.right }
            end
            if tickCount == 60 * 9.4 then
                character.riding_state = { acceleration = defines.riding.acceleration.accelerating, direction = defines.riding.direction.straight }
            end
        end)
  ]],
        update =
        [[
  ]]
    }

    menu_simulations.ae_fossil_plants =
    {
        checkboard = false,
        save = "__pyalternativeenergygraphics__/menu-simulations/menu-simulation-ae-fossil-plants.zip",
        length = 60 * 20,
        init =
        [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
        update =
        [[
  ]]
    }

    menu_simulations.ae_renewable =
    {
        checkboard = false,
        save = "__pyalternativeenergygraphics__/menu-simulations/menu-simulation-ae-renewable.zip",
        length = 60 * 20,
        init =
        [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+9.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
        update =
        [[
  ]]
    }

    menu_simulations.ae_nuclear =
    {
        checkboard = false,
        save = "__pyalternativeenergygraphics__/menu-simulations/menu-simulation-ae-nuclear.zip",
        length = 60 * 20,
        init =
        [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "py-logo-15tiles", limit = 1}[1]
    game.simulation.camera_position = {logo.position.x, logo.position.y+10.25}
    game.simulation.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do
        entity.destroy()
    end
  ]],
        update =
        [[
  ]]
    }
end
