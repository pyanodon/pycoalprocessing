local menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations

menu_simulations.artillery = nil
menu_simulations.big_defense = nil
menu_simulations.biter_base_artillery = nil
menu_simulations.biter_base_laser_defense = nil
menu_simulations.biter_base_player_attack = nil
menu_simulations.biter_base_spidertron = nil
menu_simulations.biter_base_steamrolled = nil
menu_simulations.brutal_defeat = nil
menu_simulations.burner_city = nil
menu_simulations.chase_player = nil
menu_simulations.early_smelting = nil
menu_simulations.forest_fire = nil
menu_simulations.lab = nil
menu_simulations.logistic_robots = nil
menu_simulations.mining_defense = nil
menu_simulations.nuclear_power = nil
menu_simulations.oil_pumpjacks = nil
menu_simulations.oil_refinery = nil
menu_simulations.solar_power_construction = nil
menu_simulations.spider_ponds = nil
menu_simulations.train_junction = nil
menu_simulations.train_station = nil

if mods["pyalienlife"] then
  menu_simulations.al_early =
  {
    checkboard = false,
    save = "__pycoalprocessing__/menu-simulations/menu-simulation-al-early.zip",
    length = 60 * 20,
    init =
    [[
      local surface = game.surfaces.nauvis
      local logo = surface.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
      game.camera_position = {logo.position.x, logo.position.y+9.75}
      game.camera_zoom = 1
      game.tick_paused = false

      for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do 
        entity.destroy()
      end
    ]],
    update =
    [[
    ]]
  }

  menu_simulations.al_spaghetti =
  {
    checkboard = false,
    save = "__pycoalprocessing__/menu-simulations/menu-simulation-al-spaghetti.zip",
    length = 60 * 20,
    init =
    [[
      local surface = game.surfaces.nauvis
      local logo = surface.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
      game.camera_position = {logo.position.x, logo.position.y+9.75}
      game.camera_zoom = 1
      game.tick_paused = false

      for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do 
        entity.destroy()
      end
    ]],
    update =
    [[
    ]]
  }

  menu_simulations.al_late =
  {
    checkboard = false,
    save = "__pycoalprocessing__/menu-simulations/menu-simulation-al-late.zip",
    length = 60 * 20,
    init =
    [[
      local surface = game.surfaces.nauvis
      local logo = surface.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
      game.camera_position = {logo.position.x, logo.position.y+9.75}
      game.camera_zoom = 1
      game.tick_paused = false

      for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do 
        entity.destroy()
      end

      local y = game.camera_position.y + 17
      local x = game.camera_position.x - 40
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

if mods["pyalternativeenergy"] then
  menu_simulations.ae_early =
  {
  checkboard = false,
  save = "__pycoalprocessing__/menu-simulations/menu-simulation-ae-early.zip",
  length = 60 * 15,
  init =
  [[
    local surface = game.surfaces.nauvis
    local logo = surface.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
    game.camera_position = {logo.position.x, logo.position.y+9.75}
    game.camera_zoom = 1
    game.tick_paused = false

    for _, entity in ipairs(surface.find_entities_filtered{ type="character"}) do 
      entity.destroy()
    end

    local y = game.camera_position.y + 8
    local x = game.camera_position.x + 40
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
    save = "__pycoalprocessing__/menu-simulations/menu-simulation-ae-fossil-plants.zip",
    length = 60 * 20,
    init =
    [[
      local surface = game.surfaces.nauvis
      local logo = surface.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
      game.camera_position = {logo.position.x, logo.position.y+9.75}
      game.camera_zoom = 1
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
    save = "__pycoalprocessing__/menu-simulations/menu-simulation-ae-renewable.zip",
    length = 60 * 20,
    init =
    [[
      local surface = game.surfaces.nauvis
      local logo = surface.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
      game.camera_position = {logo.position.x, logo.position.y+9.75}
      game.camera_zoom = 1
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
