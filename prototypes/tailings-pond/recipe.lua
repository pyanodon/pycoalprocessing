local tailings_pond = {
    type = "recipe",
    name = "tailings-pond",
    enabled = "true",
    ingredients =
    {
      {"iron-plate", 1},
      {"iron-stick", 5},
    },
    result = "tailings-pond"
}

data:extend({tailings_pond})
