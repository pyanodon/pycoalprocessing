local Area=require("stdlib.area.area")

local function on_player_created(event)
  local player = game.players[event.player_index]
  player.insert("deconstruction-planner")
  player.insert("magic-wand")
  player.insert("tailings-pond")
  player.insert("creative-mode_fluid-source")
  player.insert("creative-mode_energy-source")
  player.insert("creative-mode_super-electric-pole")
end
script.on_event(defines.events.on_player_created, on_player_created)

local function on_player_joined_game(event)
  local player = game.players[event.player_index]
  player.clear_console()
  local surface = player.surface
  local area = {{-200, -200}, {200, 200}}
  local entities = surface.find_entities(area)
  for _, entity in pairs(entities) do
    if entity.name ~= "player" then
      entity.destroy()
    end
  end

  local tiles = {}
  for x, y in Area.spiral_iterate(area) do
    tiles[#tiles+1]={name="grass", position={x=x, y=y}}
  end
  surface.set_tiles(tiles, true)
end
script.on_event(defines.events.on_player_joined_game, on_player_joined_game)
