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
      {type="item", name="iron-oxide", amount=1, probability=0.5},
	  {type="item", name="coke", amount=4},
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
	  {type="item", name="ash", amount=1}
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
	{type="fluid", name="oxygen", amount=5},
	{type="fluid", name="water", amount=10},
	},
    results=
    {
	  {type="fluid", name="syngas", amount=7},
	  {type="fluid", name="tar", amount=3},
	  {type="item", name="ash", amount=1}
	},
    main_product= "syngas",
    icon = "__pycoalprocessing__/graphics/icons/syngas.png",
    order = "c [syn-gas2]",
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
    name = "filtersyngas",
    category = "carbonfilter",
	enabled = "false",
    energy_required = 4,
    ingredients ={
	{type="fluid", name="syngas", amount=10},
	},
    results=
    {
	  {type="fluid", name="refsyngas", amount=4},
	},
    main_product= "refsyngas",
    icon = "__pycoalprocessing__/graphics/icons/refsyngas.png",
    order = "d [refsyn-gas]",
  },

   {
    type = "recipe",
    name = "recsyngas",
    category = "rectisol",
	enabled = "false",
    energy_required = 4,
    ingredients ={
	
		{type="fluid", name="syngas", amount=10},
--		{type="fluid", name="methanol", amount=10},
	},
    results=
    {
	  {type="fluid", name="refsyngas", amount=10},
	  {type="fluid", name="hydrogen", amount=3},
	  {type="fluid", name="carbon-dioxide", amount=2},
	  {type="fluid", name="acidgas", amount=6},
	},
    main_product= "refsyngas",
    icon = "__pycoalprocessing__/graphics/icons/refsyngas.png",
    order = "e [refsyn-gas]",
  },
	
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
  
  
  {
    type = "recipe",
    name = "py-asphalt",
	category = "crafting-with-fluid",
    enabled = false,
    ingredients =
    {
	  {type="fluid", name="tar", amount=10},
      {type="item", name="ash", amount=3},
	  {type="item", name="stone", amount=5},
    },
    result = "py-asphalt",
    requester_paste_multiplier = 4
  },
  
  
  })