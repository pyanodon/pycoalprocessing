data:extend({
    
	{
      type = "recipe",
      name = "zinc-chloride",
      category = "chemistry",
      enabled = "false",
      energy_required = 4,
      ingredients ={
        {type="fluid", name="hydrogen-chloride", amount=2},
        {type="item", name="zinc-plate", amount=1},
      },
      results={
        {type="item", name="zinc-chloride", amount=1},
		{type="fluid", name="hydrogen", amount=2},
      },
      main_product= "zinc-chloride",
      icon = "__pycoalprocessing__/graphics/icons/zinc-chloride.png",
      order = "d [syn-gas]",
    },
	
	{
      type = "recipe",
      name = "tar-carbon",
      category = "tar",
      enabled = "false",
      energy_required = 4,
      ingredients ={
        {type="fluid", name="tar", amount=2},
      },
      results={
        {type="item", name="carbon", amount=1},
      },
      main_product= "carbon",
      icon = "__bobplates__/graphics/icons/carbon.png",
	  order = "d [syn-gas]",
    },
	
	{
      type = "recipe",
      name = "active-carbon",
      category = "hpf",
      enabled = "false",
      energy_required = 4,
      ingredients ={
        {type="fluid", name="nitrogen", amount=10},
        {type="item", name="zinc-chloride", amount=2},
		{type="item", name="coke", amount=25},
		{type="item", name="sodium-hydroxide", amount=15},
      },
      results={
        {type="item", name="active-carbon", amount=2},
      },
      main_product= "active-carbon",
      icon = "__pycoalprocessing__/graphics/icons/active-carbon.png",
      order = "d [syn-gas]",
    },
	
	{ 
		type = "recipe",
		name = "recsyngas-meth",
		category = "rectisol",
		enabled = "false",
		energy_required = 2,
		ingredients ={
		  {type="fluid", name="syngas", amount=10},
		  {type="fluid", name="methanol", amount=10},
		},
		results=
		{
		  {type="fluid", name="refsyngas", amount=5},
		  {type="fluid", name="hydrogen", amount=3},
		  {type="fluid", name="carbon-dioxide", amount=2},
		  {type="fluid", name="acidgas", amount=6},

		},
		main_product= "refsyngas",
		icon = "__pycoalprocessing__/graphics/icons/refsyngas.png",
		order = "f [refsyn-gas]",
	},
	
	{
		 type = "recipe",
		 name = "methanol-from-hydrogen",
		 category = "methanol",
		 enabled = "false",
		 energy_required = 3,
		 ingredients ={
			  {type="fluid", name="carbon-dioxide", amount=3},
			  {type="fluid", name="hydrogen", amount=5},
			  {type="item", name="zinc-ore", amount=1},
			  {type="item", name="alumina", amount=2},  },
		 results=
		 {
		   {type="fluid", name="methanol", amount=4},
		 },
		 main_product= "methanol",
		 icon = "__pycoalprocessing__/graphics/icons/methanol.png",
		 order = "f [methanol]",
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
  })
