data:extend({
--DISTILATOR
	{
	type = "recipe",
	name = "distilator",
	energy_requiered = 10,
	enabled = false,
	ingredients = 
	{
		{"steel-plate", 20},
		{"pipe", 10},
		{"iron-plate", 10},
		{"storage-tank", 2},
	},
	result= "distilator",
	icon = "__pycoalprocessing__/graphics/icons/distilator.png",
	},
--GASIFIER
	{
	type = "recipe",
	name = "gasifier",
	energy_requiered = 10,
	enabled = false,
	ingredients = 
	{
		{"steel-plate", 20},
		{"pipe", 20},
		{"iron-plate", 10},
		{"storage-tank", 1},
		{"electronic-circuit", 4},
	},
	result= "gasifier",
	icon = "__pycoalprocessing__/graphics/icons/gasifier.png",
	},
--TAR-PROCESSING-UNIT
	{
    type = "recipe",
    name = "tar-processing-unit",
    energy_required = 5,
	enabled = "false",
    ingredients ={
		{"steel-plate", 20},
		{"iron-plate", 10},
		{"pipe", 15},
		{"steel-furnace", 1},
		{"copper-cable", 7},
	},
    result= "tar-processing-unit",
    icon = "__pycoalprocessing__/graphics/icons/tar-processing-unit.png",
    },	
--GAS TURBINE MK01
	{
	type = "recipe",
	name = "gasturbinemk01",
	energy_requiered = 10,
	enabled = false,
	ingredients = 
	{
		{"steel-plate", 15},
		{"pipe", 10},
		{"iron-plate", 25},
		{"iron-stick", 30},
		{"iron-gear-wheel", 40},
	},
	result= "gasturbinemk01",
	icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk01.png",
	},

--CARBON-FILTER
	{
	type = "recipe",
	name = "carbon-filter",
	energy_requiered = 10,
	enabled = false,
	ingredients = 
	{
		{"assembling-machine-2", 1},
		{"pipe", 2},
		{"engine-unit", 3},
		{"iron-plate", 20},
		{"iron-gear-wheel", 30},
	},
	result= "carbon-filter",
	icon = "__pycoalprocessing__/graphics/icons/carbon-filter.png",
	},

--RECTISOL
	{
	type = "recipe",
	name = "rectisol",
	energy_requiered = 10,
	enabled = false,
	ingredients = 
	{
		{"assembling-machine-2", 2},
		{"storage-tank", 2},
		{"pipe", 20},
		{"small-pump", 2},
		{"iron-plate", 25},
		{"steel-plate", 20},
	},
	result= "rectisol",
	icon = "__pycoalprocessing__/graphics/icons/rectisol.png",
	},

--METHANOL REACTOR
	{
	type = "recipe",
	name = "methanol-reactor",
	energy_requiered = 15,
	enabled = false,
	ingredients = 
	{
		{"gasturbinemk01", 1},
		{"electrolyser", 1},
		{"electronic-circuit", 25},
		{"steel-plate", 20},
		{"steel-bearing", 15},
		
	},
	result= "methanol-reactor",
	icon = "__pycoalprocessing__/graphics/icons/methanol-reactor.png",
	},
	
	
})