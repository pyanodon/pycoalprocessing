require("stdlib.event.event")
require("stdlib.config.config")
local Area = require("stdlib.area.area")
local tracks = require("stdlib.debug.train-tracks")

local QS = Config.new((MOD and MOD.config and MOD.config.quickstart) or {})

if remote.interfaces["quickstart-script"] then
    if game then game.print("Existing quickstart script - "..remote.call("quickstart-script", "creative_mode_quickstart_registered_to")) end
    return remote.call("quickstart-script", "registered_to")
end

local qs_interface = {}
qs_interface.creative_mode_quickstart_registerd_to = function()
    game.print(QS.get("mod_name", "not-set"))
    return QS.get("mod_name", "not-set")
end
qs_interface.registered_to = function()
    return (MOD and MOD.name) or QS.get("mod_name", "not-set")
end
remote.add_interface("quickstart-script", qs_interface)

local quickstart = {}

function quickstart.on_player_created(event)
    if #game.players == 1 then
        local player = game.players[event.player_index]

        if QS.get("clear_items", false) then
            player.clear_items_inside()
        end

        local simple_stacks = QS.get("stacks", {})

        for _, item in pairs(simple_stacks) do
            if game.item_prototypes[item] then
                player.insert(item)
            end
        end

        local power_armor = QS.get("power_armor", "fake")
        if game.item_prototypes[power_armor] then
            --Put on power armor, install equipment
            local inv = player.get_inventory(defines.inventory.player_armor)
            inv.insert(power_armor)
            local armor = inv[1].grid
            for _, eq in pairs(QS.get("equipment", {"fusion-reactor-equipment"})) do
                if game.equipment_prototypes[eq] then
                    armor.put{name = eq}
                end
            end
        end

        local surface = player.surface
        local force = player.force
        local area = QS.get("area_box", {{-100, -100}, {100, 100}})
        player.force.chart(surface, area)

        if QS.get("disable_rso_starting", false) and remote.interfaces["RSO"] and remote.interfaces["RSO"]["disableStartingArea"] then
            remote.call("RSO", "disableStartingArea")
        end
        if QS.get("disable_rso_chunk", false) and remote.interfaces["RSO"] and remote.interfaces["RSO"]["disableChunkHandler"] then
            remote.call("RSO", "disableChunkHandler")
        end

        if QS.get("destroy_everything", false) then
            for _, entity in pairs(surface.find_entities(area)) do
                if entity.name ~= "player" then
                    entity.destroy()
                end
            end
        end

        if QS.get("floor_tile", false) then
            local tiles = {}
            local floor_tile = QS.get("floor_tile")
            local floor_tile_alt = QS.get("floor_tile_alt", floor_tile)
            for x, y in Area.spiral_iterate(area) do
                if y % 2 == 0 then
                    if x % 2 == 0 then
                        tiles[#tiles+1]={name=floor_tile, position={x=x, y=y}}
                    else
                        tiles[#tiles+1]={name=floor_tile_alt, position={x=x, y=y}}
                    end
                else
                    if x % 2 ~= 0 then
                        tiles[#tiles+1]={name=floor_tile, position={x=x, y=y}}
                    else
                        tiles[#tiles+1]={name=floor_tile_alt, position={x=x, y=y}}
                    end
                end
            end
            surface.set_tiles(tiles, true)
            surface.destroy_decoratives(area)
        end

        if QS.get("chunk_bounds", false) then
            if game.entity_prototypes["debug-chunk-marker"] then
                local a = surface.create_entity{name="debug-chunk-marker", position={0,0}}
                a.graphics_variation = 1
                for i = 1, 31, 2 do
                    a = surface.create_entity{name="debug-chunk-marker", position={i,0}}
                    a.graphics_variation = 2
                    a = surface.create_entity{name="debug-chunk-marker", position={-i,0}}
                    a.graphics_variation = 2
                    a = surface.create_entity{name="debug-chunk-marker", position={0,i}}
                    a.graphics_variation = 3
                    a = surface.create_entity{name="debug-chunk-marker", position={0,-i}}
                    a.graphics_variation = 3
                end
                local tiles = {}
                for i = .5, 32.5, 1 do
                    tiles[#tiles + 1] = {name = "hazard-concrete-left", position = {i, 32.5}}
                    tiles[#tiles + 1] = {name = "hazard-concrete-right", position = {-i, 32.5}}
                    tiles[#tiles + 1] = {name = "hazard-concrete-left", position = {i, -32.5}}
                    tiles[#tiles + 1] = {name = "hazard-concrete-right", position = {-i, -32.5}}

                    tiles[#tiles + 1] = {name = "hazard-concrete-left", position = {32.5, i}}
                    tiles[#tiles + 1] = {name = "hazard-concrete-left", position = {32.5, -i}}
                    tiles[#tiles + 1] = {name = "hazard-concrete-right", position = {-32.5, i}}
                    tiles[#tiles + 1] = {name = "hazard-concrete-right", position = {-32.5, -i}}
                end
                surface.set_tiles(tiles)
            end
        end

        if QS.get("starter_tracks", false) then
            for _, track in pairs(tracks) do
                local pos = {track.position.x + 1, track.position.y + 1}
                local ent = surface.create_entity{name=track.name, position=pos, direction=track.direction, force=force}
                if ent.name == "train-stop" then
                    if ent.position.x > 0 and ent.position.y > 0 then ent.backer_name = "#SOUTH"
                    elseif ent.position.x < 0 and ent.position.y > 0 then ent.backer_name = "#WEST"
                    elseif ent.position.x > 0 and ent.position.y < 0 then ent.backer_name = "#EAST"
                    else ent.backer_name = "#NORTH" end
                end

            end
            if QS.get("make_train", false) then
                local loco = surface.create_entity{name="locomotive", position={20, 39}, orientation=0.25, direction=2, force=force}
                loco.orientation = .25
                loco.get_fuel_inventory().insert({name = "rocket-fuel", count = 30})
                local cwag = surface.create_entity{name="cargo-wagon", position={13, 39}, orientation=0.25, direction=2, force=force}
                cwag.orientation = .25
                local fwag = surface.create_entity{name="fluid-wagon", position={6, 39}, orientation=0.25, direction=2, force=force}
                fwag.orientation = .25

                local train = loco and loco.train
                if train then
                    local records = {}
                    for _, name in pairs ({"#SOUTH", "#EAST", "#NORTH", "#WEST"}) do
                        records[#records + 1] = {station = name, wait_conditions = {{type = "time", ticks = 0, compare_type = "and"}}}
                    end
                    records[1].wait_conditions = {{type = "full", compare_type = "and"}}
                    train.schedule = {current = 1, records = records}
                    train.manual_mode = false
                end
            end
            --x=22, 15, 8, y=39, o=.25

        end

        if QS.get("center_map_tag", false) then
            local tag = {
                position = {0, 0},
                icon = {type = "virtual", name = "signal-0"},
            }
            force.add_chart_tag(surface, tag)
        end

        if QS.get("setup_power", false) and game.active_mods["creative-mode"] then
            surface.create_entity{name="creative-mode_energy-source", position={-1, -33}, force=player.force}
            surface.create_entity{name="creative-mode_super-substation", position={1, -33}, force=player.force}
            --surface.create_entity{name="creative-mode_super-radar", position={3.5, -33.5}, force=player.force}
            --surface.create_entity{name="creative-mode_super-roboport", position={-4, -34}, force=player.force}
        end
    end
end
Event.register(defines.events.on_player_created, quickstart.on_player_created)

return quickstart
