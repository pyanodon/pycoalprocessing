local tailings_pond = {
  type = "item",
  name = "tailings-pond",
  icon = "__pycoalprocessing__/graphics/icons/tailings-pond.png",
  flags = {"goes-to-quickbar"},
  subgroup = "coal-processing",
  order = "t",
  place_result = "tailings-pond",
  stack_size = 50
}

data:extend({tailings_pond})
