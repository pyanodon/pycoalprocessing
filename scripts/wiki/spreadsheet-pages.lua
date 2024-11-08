local floor = math.floor
local function on_search(search_key, gui)
	gui = gui.content
	if not gui then return end
	if search_key == "" then
		for _, row in pairs(gui.children) do
			row.visible = true
		end
		return
	end
	for _, row in pairs(gui.children) do
		local visible = row.name:find(search_key, 1, true) or row.name:find(search_key:gsub(" ", "-"), 1, true) or row.name:find(search_key:gsub(" ", ""), 1, true)
		row.visible = not not visible
	end
end

local function update_spreadsheet(gui, player, data, sort_by, asc)
	if gui.content then
		gui.content.destroy()
	end
	local content = gui.add {type = "flow", direction = "vertical", name = "content"}

	local rows = data.rows
	local columns = data.columns

	table.sort(rows, function(a, b)
		local order_1, order_2 = (a[sort_by].order or ""), (b[sort_by].order or "")
		if order_1 == order_2 then
			order_1, order_2 = a["localised-name"].order, b["localised-name"].order
		end
		if asc then
			return order_1 > order_2
		else
			return order_1 < order_2
		end
	end)

	for _, row in pairs(rows) do
		local container = content.add {type = "flow", direction = "vertical", name = row.search_key}
		local flow = container.add {type = "flow", direction = "horizontal", tags = row}
		for i, column in pairs(columns) do
			local line_item = row[column.name]
			local caption = line_item.value
			local elem_tooltip = line_item.elem_tooltip
			local tooltip = line_item.tooltip

			if i == 1 then
				flow.add {type = "label", caption = caption, elem_tooltip = elem_tooltip, tooltip = tooltip}.style.width = column.width + 10
			else
				local flow = flow.add {type = "flow"}
				flow.style.horizontal_align = "center"
				flow.style.width = column.width + 10
				flow.add {type = "label", caption = caption, elem_tooltip = elem_tooltip, tooltip = tooltip}
			end
		end
		container.add {type = "line", direction = "horizontal"}
	end

	data.prefered_sorts[player.index] = {sort_by, asc}

	local search_key = remote.call("pywiki", "get_page_searchbar", player).text
	on_search(search_key, gui)
end

local function create_spreadsheet(gui, player, data)
	local title = gui.add {direction = "horizontal", type = "frame", style = "subheader_frame_with_text_on_the_right"}
	title.style.right_margin = -2000
	title.style.left_margin = -15
	title.style.horizontally_stretchable = true
	title.add {type = "empty-widget"}.style.width = 5

	local sort_settings = data.prefered_sorts[player.index] or data.default_sort
	local sort_by, asc = sort_settings[1], sort_settings[2]
	for _, column in pairs(data.columns) do
		local flow = title.add {type = "flow", direction = "horizontal"}
		flow.style.width = column.width
		flow.style.vertical_align = "center"

		flow.add {
			type = "label", style = "subheader_label",
			caption = {"", "[font=default-semibold][color=255,230,192]", {"pywiki-spreadsheets." .. column.name}, "[/color][/font]"}
		}.style.maximal_width = column.width - 20
		flow.add {type = "empty-widget", style = "py_empty_widget"}
		local button = flow.add {type = "sprite-button", name = "py_spreadsheet_sort_" .. column.name, style = "py_schedule_move_button_alt", sprite = "white-circle"}
		button.tags = {data_source = data.name, column_name = column.name}

		if sort_by == column.name then
			button.sprite = asc and "up-white" or "down-white"
			button.hovered_sprite = asc and "up-black" or "down-black"
			button.clicked_sprite = asc and "up-black" or "down-black"
		end

		title.add {type = "line", direction = "vertical"}
	end
	title.add {type = "empty-widget"}.style.horizontally_stretchable = true

	update_spreadsheet(gui, player, data, sort_by, asc)
end

remote.add_interface("pywiki_spreadsheets", {
	create_fluid_page = function(gui, player) create_spreadsheet(gui, player, storage.fluid_spreadsheet_data) end,
	create_solid_fuel_page = function(gui, player) create_spreadsheet(gui, player, storage.solid_fuel_spreadsheet_data) end,
	create_decay_page = function(gui, player) create_spreadsheet(gui, player, storage.decay_spreadsheet_data) end,
	on_search = on_search
})

local function funny_square(color)
	local r = color.r * 255
	local g = color.g * 255
	local b = color.b * 255

	return "[color=" .. tostring(floor(r)) .. ", " .. tostring(floor(g)) .. ", " .. tostring(floor(b)) .. "]■[/color]"
end

local function hue(color)
	local red = color.r
	local green = color.g
	local blue = color.b

	local min = math.min(math.min(red, green), blue)
	local max = math.max(math.max(red, green), blue)
	if min == max then return 0 end

	local hue = 0
	if max == red then
		hue = (green - blue) / (max - min)
	elseif max == green then
		hue = 2 + (blue - red) / (max - min)
	else
		hue = 4 + (red - green) / (max - min)
	end

	hue = hue * 60
	if hue < 0 then hue = hue + 360 end
	return hue + 1
end

local function brightness(color)
	return (color.r + color.g + color.b) / 3
end

local function tooltipify_color(color)
	return floor(color.r * 255) .. ", " .. floor(color.g * 255) .. ", " .. floor(color.b * 255)
end

local science_pack_names = {
	"automation-science-pack",
	"py-science-pack-1",
	"logistic-science-pack",
	"military-science-pack",
	"py-science-pack-2",
	"chemical-science-pack",
	"py-science-pack-3",
	"production-science-pack",
	"py-science-pack-4",
	"utility-science-pack",
	"space-science-pack",
}

local inverted_pack_list = {}
for k, v in pairs(science_pack_names) do inverted_pack_list[v] = k end
local function calculate_highest_science_pack(tech)
	local result = 0
	for _, pack in pairs(tech.research_unit_ingredients) do
		local tier = inverted_pack_list[pack.name]
		if tier and result < tier then
			result = tier
		end
	end
	return result
end

local min = math.min
local function calculate_required_science()
	local result = {
		["water"] = 0,
		["steam"] = 0,
		["geothermal-water"] = 2,
		["raw-coal"] = 0,
		["kerogen"] = 0,
		["fish-mk01"] = 0,
		["wood"] = 0,
	}

	local recipe_required_science = {}

	for _, recipe in pairs(prototypes.recipe) do
		if recipe.enabled then
			recipe_required_science[recipe.name] = 0
		end
	end

	local recipes = prototypes.recipe
	local recipes_to_check = {}
	for _, tech in pairs(prototypes.technology) do
		if not tech.hidden and not tech.research_unit_count_formula and tech.name ~= "fluid-handling" and tech.name ~= "plastics" then
			for _, effect in pairs(tech.effects) do
				if effect.type == "unlock-recipe" then
					local name = effect.recipe
					recipes_to_check[name] = recipes[name]
					recipe_required_science[name] = min(recipe_required_science[name] or math.huge, calculate_highest_science_pack(tech))
				end
			end
		end
	end

	for recipe_name, recipe in pairs(recipes_to_check) do
		for _, product in pairs(recipe.products) do
			product = prototypes.item[product.name] or prototypes.fluid[product.name]
			local already_seen = {}
			while product do
				local name = product.name
				if already_seen[name] then break end
				result[name] = min(result[name] or math.huge, recipe_required_science[recipe_name] or math.huge)
				already_seen[name] = true
				if product.type == "item" then product = product.spoil_result else product = nil end
			end
		end
	end

	return result
end

local function calculate_unlocked_at(required_science, name)
	local jerry_check, _, fluid_name = name:find("^(.+)%-canister$")
	if jerry_check then name = fluid_name end

	local required_science = required_science[name]
	local required_science_pack, elem_tooltip
	if not required_science then
		required_science_pack = "[fluid=fluid-unknown]"
	elseif required_science ~= 0 then
		required_science_pack = "[item=" .. science_pack_names[required_science] .. "]"
		elem_tooltip = {type = "item", name = science_pack_names[required_science]}
	end

	return {
		value = required_science_pack,
		order = required_science or #science_pack_names + 1,
		pack = science_pack_names[required_science or 0] or "",
		elem_tooltip = elem_tooltip
	}
end

local function generate_fluid_spreadsheet_data(required_science)
	storage.fluid_spreadsheet_data = {
		columns = {
			{name = "localised-name", width = 200},
			{name = "voidable",       width = 120},
			{name = "fuel-value",     width = 120},
			{name = "color",          width = 120},
			{name = "unlocked-at",    width = 120},
		},
		rows = {},
		name = "fluid_spreadsheet_data",
		default_sort = {"localised-name", false},
		prefered_sorts = {}
	}

	for name, fluid in pairs(prototypes.fluid) do
		if not fluid.hidden and not (script.active_mods["pyalternativeenergy"] and fluid.name == "combustion-mixture1") then
			local fuel_value
			if fluid.fuel_value ~= 0 then fuel_value = py.format_energy(fluid.fuel_value, "J") end

			local voidable = "[entity=tailings-pond]"
			local voidable_elem_tooltip
			if fluid.name == "neutron" then
				voidable = "[entity=neutron-absorber-mk01] [entity=neutron-absorber-mk02] [entity=neutron-absorber-mk03] [entity=neutron-absorber-mk04]"
				voidable_elem_tooltip = {type = "entity", name = "neutron-absorber-mk01"}
			elseif script.active_mods["pyindustry"] then
				local void_entity_name = (fluid.default_temperature or 15) < (fluid.gas_temperature or math.huge) and "py-sinkhole" or "py-gas-vent"
				voidable = voidable .. "  [entity=" .. void_entity_name .. "]"
				voidable_elem_tooltip = {type = "entity", name = void_entity_name}
			end

			local unlocked_at = calculate_unlocked_at(required_science, name)

			table.insert(storage.fluid_spreadsheet_data.rows, {
				["localised-name"] = {
					value = {"", "[fluid=" .. name .. "] ", fluid.localised_name},
					order = name,
					elem_tooltip = {type = "fluid", name = name}
				},
				voidable = {
					value = voidable,
					order = voidable,
					elem_tooltip = voidable_elem_tooltip
				},
				["fuel-value"] = {
					value = fuel_value,
					order = fluid.fuel_value
				},
				color = {
					value = funny_square(fluid.base_color),
					order = floor(hue(fluid.base_color)) + brightness(fluid.base_color) / 10,
					tooltip = tooltipify_color(fluid.base_color)
				},
				["unlocked-at"] = unlocked_at,
				search_key = name .. "|" .. unlocked_at.pack
			})
		end
	end
end

local function generate_soild_fuel_spreadsheet_data(required_science)
	storage.solid_fuel_spreadsheet_data = {
		columns = {
			{name = "localised-name", width = 200},
			{name = "fuel-category",  width = 120},
			{name = "fuel-value",     width = 120},
			{name = "burnt-result",   width = 120},
			{name = "unlocked-at",    width = 120},
		},
		rows = {},
		name = "solid_fuel_spreadsheet_data",
		default_sort = {"localised-name", false},
		prefered_sorts = {}
	}

	for name, item in pairs(prototypes.item) do
		if item.fuel_category and not item.hidden then
			local burnt_result, burnt_result_order, burnt_result_tooltip
			if item.burnt_result then
				burnt_result = "[item=" .. item.burnt_result.name .. "]"
				burnt_result_order = item.burnt_result.name
				burnt_result_tooltip = {type = "item", name = item.burnt_result.name}
			end

			local unlocked_at = calculate_unlocked_at(required_science, name)

			table.insert(storage.solid_fuel_spreadsheet_data.rows, {
				["localised-name"] = {
					value = {"", "[item=" .. name .. "] ", item.localised_name},
					order = name,
					elem_tooltip = {type = "item", name = name}
				},
				["fuel-category"] = {
					value = prototypes.fuel_category[item.fuel_category].localised_name,
					order = item.fuel_category or ""
				},
				["fuel-value"] = {
					value = py.format_energy(item.fuel_value, "J"),
					order = item.fuel_value
				},
				["burnt-result"] = {
					value = burnt_result,
					order = burnt_result_order,
					elem_tooltip = burnt_result_tooltip
				},
				["unlocked-at"] = unlocked_at,
				search_key = name .. "|" .. item.fuel_category .. "|" .. (burnt_result_order or "") .. "|" .. unlocked_at.pack
			})
		end
	end
end

local function generate_decay_spreadsheet_data(required_science)
	storage.decay_spreadsheet_data = {
		columns = {
			{name = "localised-name", width = 200},
			{name = "decay-time",     width = 180},
			{name = "decay-result",   width = 240},
			{name = "unlocked-at",    width = 120},
		},
		rows = {},
		name = "decay_spreadsheet_data",
		default_sort = {"localised-name", false},
		prefered_sorts = {}
	}

	for name, item in pairs(prototypes.item) do
		local decay_ticks = item.get_spoil_ticks()
		if 0 == decay_ticks then goto continue end

		local decay_result = ""
		local decay_chain = {}
		local already_seen = {}
		local total_decay_ticks = 0

		if item.spoil_to_trigger_result then
			decay_result = "[Trigger]"
		else
			local spoilage_item = item
			while spoilage_item do
				table.insert(decay_chain, spoilage_item)
				if already_seen[spoilage_item.name] then
					total_decay_ticks = "[color=255,170,0] ∞ [/color]"
					break
				end
				total_decay_ticks = total_decay_ticks + spoilage_item.get_spoil_ticks()
				already_seen[spoilage_item.name] = true
				spoilage_item = spoilage_item.spoil_result
			end
			local arrow_emoji = "[font=default-bold][color=255,200,200] → [/color][/font]"
			for i = 1, #decay_chain do
				local spoilage_item = decay_chain[i]
				decay_result = decay_result .. "[item=" .. spoilage_item.name .. "]"
				if i ~= #decay_chain then decay_result = decay_result .. arrow_emoji end
			end
		end

		local unlocked_at = calculate_unlocked_at(required_science, name)

		local decay_time_string = py.format_large_time(decay_ticks / 60)
		if type(total_decay_ticks) == "string" then
			decay_time_string = decay_time_string .. " [font=default-small](" .. total_decay_ticks .. ")[/font]"
		elseif total_decay_ticks > decay_ticks then
			decay_time_string = decay_time_string .. " [font=default-small](" .. py.format_large_time(total_decay_ticks / 60) .. ")[/font]"
		end

		table.insert(storage.decay_spreadsheet_data.rows, {
			["localised-name"] = {
				value = {"", "[item=" .. name .. "] ", item.localised_name},
				order = name,
				elem_tooltip = {type = "item", name = name}
			},
			["decay-time"] = {
				value = decay_time_string,
				order = decay_ticks
			},
			["decay-result"] = {
				value = decay_result,
				order = string.format("%06x", #decay_chain) .. string.format("%06x", table_size(already_seen)) .. decay_result
			},
			["unlocked-at"] = unlocked_at,
			search_key = name .. "|" .. decay_ticks .. "|" .. decay_result .. "|" .. unlocked_at.pack
		})
		::continue::
	end
end

py.on_event(py.events.on_init(), function()
	local required_science = calculate_required_science()
	
	generate_fluid_spreadsheet_data(required_science)
	generate_soild_fuel_spreadsheet_data(required_science)
	generate_decay_spreadsheet_data(required_science)	
end)

gui_events[defines.events.on_gui_click]["py_spreadsheet_sort"] = function(event)
	local player = game.get_player(event.player_index)
	local gui = remote.call("pywiki", "get_page_contents", player)
	if not gui then return end
	local element = event.element
	local tags = element.tags

	for _, other_button in pairs(element.parent.parent.children) do
		other_button = other_button.children[3]
		if other_button and other_button.type == "sprite-button" and other_button ~= element then
			other_button.sprite = "white-circle"
			other_button.hovered_sprite = "white-circle"
			other_button.clicked_sprite = "white-circle"
		end
	end

	if element.sprite == "white-circle" or element.sprite == "down-white" then
		element.sprite = "up-white"
		element.hovered_sprite = "up-black"
		element.clicked_sprite = "up-black"
	elseif element.sprite == "up-white" then
		element.sprite = "down-white"
		element.hovered_sprite = "down-black"
		element.clicked_sprite = "down-black"
	end

	update_spreadsheet(gui, player, storage[tags.data_source], tags.column_name, element.sprite == "up-white")
end
