--luacheck: no global
require("stdlib/event/event")

local scripts = {}
function scripts.csv_fluids()
  local header = "Fluid, Def Temp, Max Temp, Heat Cap, Press to Speed, Flow to Energy\n"
  game.write_file("logs/pycoalprocessing/fluid_data.csv", header)
  for _, fluid in pairs (game.fluid_prototypes) do
    local string
    --string = "["..fluid.name.."]"
    string = fluid.name .. "," ..fluid.default_temperature .. "," .. fluid.max_temperature .. ",".. fluid.heat_capacity .. "," .. fluid.pressure_to_speed_ratio .. ","..fluid.flow_to_energy_ratio .. "\n"
    game.write_file("logs/pycoalprocessing/fluid_data.csv",string,true)
  end
end


debug_scripts = {}
function debug_scripts.init()
  for name, _ in pairs(scripts) do
    scripts[name]()
  end
end

Event.register(Event.core_events.init, debug_scripts.init)
return debug_scripts
