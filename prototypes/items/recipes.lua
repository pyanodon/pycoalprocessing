data:extend({
    {
      type = "recipe",
      name = "canister",
      category = "methanol",
      enabled = "false",
      energy_required = 3,
      ingredients ={
        {type="fluid", name="syngas", amount=5},
        {type="item", name="steel-plate", amount=1},
        {type="item", name="copper-ore", amount=2},
        {type="item", name="zinc-ore", amount=1},
      },
      results=
      {
        {type="item", name="canister", amount=1}
      },
      main_product= "canister",
      icon = "__pycoalprocessing__/graphics/icons/canister.png",
      order = "c [methanol]",
    },

    {
      type = "recipe",
      name = "canister2",
      category = "methanol",
      enabled = "false",
      energy_required = 3,
      ingredients ={
        {type="fluid", name="carbon-dioxide", amount=3},
        {type="fluid", name="hydrogen", amount=5},
        {type="item", name="steel-plate", amount=1},
        {type="item", name="zinc-ore", amount=1},
        {type="item", name="alumina", amount=2},
      },
      results=
      {
        {type="item", name="canister", amount=1},
        {type="fluid", name="water", amount=2},
      },
      main_product= "canister",
      icon = "__pycoalprocessing__/graphics/icons/canister.png",
      order = "d [methanol]",
    },

    {
      type = "recipe",
      name = "iron-oxide",
      category = "smelting",
      energy_required = 3.5,
      ingredients = {{"iron-oxide", 1}},
      result = "iron-ore"
    },
  })
