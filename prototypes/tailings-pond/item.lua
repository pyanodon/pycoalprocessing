local tailings_pond = {
  type = "item",
  name = "tailings-pond",
  icon = "__tailings-pond__/graphics/item/tailings-pond-item-icon.png",
  flags = {"goes-to-quickbar"},
  subgroup = "circuit-network",
  order = "c-a",
  place_result = "tailings-pond",
  stack_size = 50
}

data:extend({tailings_pond})
