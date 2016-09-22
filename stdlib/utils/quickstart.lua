_G.Event = _G.Event or require("stdlib.event.event")

local Area=require("stdlib.area.area")

local function on_player_created(event)
  local player = game.players[event.player_index]

  local simple_stack =
  {
    "deconstruction-planner",
    "tailings-pond",
    "magic-wand",
    "creative-mode_fluid-source",
    "creative-mode_energy-source",
    "creative-mode_super-electric-pole",
  }

  for _, item in pairs(simple_stack) do
    if game.item_prototypes[item] then
      player.insert(item)
    end
  end

end
_G.Event.register(defines.events.on_player_created, on_player_created)

local function on_player_joined_game(event)
  local player = game.players[event.player_index]
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
    tiles[#tiles+1]={name="polluted-ground", position={x=x, y=y}}
  end
  surface.set_tiles(tiles, true)

  player.clear_console()
end
_G.Event.register(defines.events.on_player_joined_game, on_player_joined_game)
