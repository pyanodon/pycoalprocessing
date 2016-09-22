data:extend({
  {
    type = "recipe",
    name = "coal-gas",
    category = "distilator",
	enabled = "false",
    energy_required = 3,
    ingredients ={
	{type="item", name="coal", amount=10},
	},
    results=
    {
	  {type="fluid", name="coal-gas", amount=4},
	  {type="fluid", name="tar", amount=5},
      {type="item", name="iron-oxide", amount=2},
	  {type="item", name="coke", amount=7},
    },
    main_product= "coal-gas",
    icon = "__pycoalprocessing__/graphics/icons/coalgas.png",
    order = "a [coal-gas]",
  },
    {
    type = "recipe",
    name = "syngas",
    category = "gasifier",
	enabled = "false",
    energy_required = 3,
    ingredients ={
	{type="fluid", name="coal-gas", amount=4},
	{type="fluid", name="water", amount=10},

	},
    results=
    {
	  {type="fluid", name="syngas", amount=4},
	  {type="fluid", name="tar", amount=3},
	},
    main_product= "syngas",
    icon = "__pycoalprocessing__/graphics/icons/syngas.png",
    order = "b [syn-gas]",
  },

    {
    type = "recipe",
    name = "syngas2",
    category = "gasifier",
	enabled = "false",
    energy_required = 3,
    ingredients ={
	{type="fluid", name="coal-gas", amount=4},
	{type="fluid", name="water", amount=10},
	{type="fluid", name="oxygen", amount=10},

	},
    results=
    {
	  {type="fluid", name="syngas", amount=10},
	  {type="fluid", name="tar", amount=3},
	},
    main_product= "syngas",
    icon = "__pycoalprocessing__/graphics/icons/syngas.png",
    order = "b [syn-gas]",
  },
  
{
    type = "recipe",
    name = "creosote",
    category = "tar",
	enabled = "false",
    energy_required = 3,
    ingredients ={
	{type="fluid", name="tar", amount=10},
	},
    results=
    {
	  {type="fluid", name="creosote", amount=5},
	},
    main_product= "creosote",
    icon = "__pycoalprocessing__/graphics/icons/creosote.png",
    order = "c [syn-gas]",
  },
	
  {
    type = "recipe",
    name = "iron-oxide",
    category = "smelting",
    energy_required = 3.5,
    ingredients = {{"iron-oxide", 1}},
    result = "iron-ore"
  },
  
  {
    type = "recipe",
    name = "medium-electric-pole",
	category = "crafting-with-fluid",
    enabled = false,
    ingredients =
    {
      {type="fluid", name="creosote", amount=10},
      {type="item", name="steel-plate", amount=2},
	  {type="item", name="copper-plate", amount=2},
    },
    result = "medium-electric-pole",
    requester_paste_multiplier = 4
  },
  
  {
    type = "recipe",
    name = "rail",
	category = "crafting-with-fluid",
    enabled = false,
    ingredients =
    {
	  {type="fluid", name="creosote", amount=10},
      {type="item", name="steel-plate", amount=1},
	  {type="item", name="stone", amount=1},
	  {type="item", name="raw-wood", amount=2},
    },
    result = "rail",
    result_count = 2,
    requester_paste_multiplier = 4
  },
  
  })