local style = data.raw['gui-style'].default

style.py_entity_preview = {
	type = 'empty_widget_style',
	vertically_stretchable = 'on',
	horizontally_stretchable = 'on',
	padding = 0,
	graphical_set = {
		base = {
			position = {17, 0}, corner_size = 8,
			center = {position = {76, 8}, size = {1, 1}},
			draw_type = 'outer'
		},
		shadow = default_inner_shadow
	}
}

style.py_nice_frame = {
  type = 'frame_style',
  vertically_stretchable = 'off',
  parent = 'deep_frame_in_shallow_frame'
}

style.py_caravan_camera = {
	type = 'camera_style',
	minimal_height = 256,
	minimal_width = 256,
	horizontally_stretchable = 'on',
	graphical_set = {}
}

style.py_empty_widget = {
	type = 'empty_widget_style',
	horizontally_stretchable = 'stretch_and_expand',
	horizontally_squashable = 'on',
}

local button_style = style.button
style.py_clicked_train_schedule_action_button = {
  type = 'button_style',
  parent = 'train_schedule_action_button',
  default_font_color = button_style.selected_font_color,
  default_graphical_set = button_style.selected_graphical_set,
  hovered_font_color = button_style.selected_hovered_font_color,
  hovered_graphical_set = button_style.selected_hovered_graphical_set,
  clicked_font_color = button_style.selected_clicked_font_color,
  clicked_graphical_set = button_style.selected_clicked_graphical_set
}

style.py_compact_notched_slider = {
  type = 'slider_style',
  parent = 'notched_slider',
  horizontally_squashable = 'on',
  natural_width = 400,
  minimal_width = 20
}

style.py_compact_slider_value_textfield = {
	type = 'textbox_style',
	parent = 'slider_value_textfield',
	width = 40
}

style.py_schedule_move_button = {
	type = 'button_style',
	parent = 'train_schedule_delete_button',
	default_graphical_set = {
		base = {position = {68, 0}, corner_size = 8},
		shadow = {position = {399, 90}, corner_size = 4, draw_type = 'outer'} -- Removes black lines at right and bottom of shadow
	}
}

style.py_schedule_move_button_alt = {
	type = 'button_style',
	parent = 'py_schedule_move_button',
	default_graphical_set = {
		base = {position = {68, 0}, corner_size = 8},
		shadow = {position = {399, 90}, corner_size = 2, draw_type = 'inner'}
	}
}

style.frame_action_button_always_on = {
	type = 'button_style',
	parent = 'frame_action_button',
	graphical_set = style.frame_button.clicked_graphical_set,
	default_graphical_set = style.frame_button.clicked_graphical_set,
	hovered_graphical_set = style.frame_button.clicked_graphical_set
}

style.confirm_button_without_tooltip_unhoverable = {
	type = 'button_style',
	parent = 'confirm_button_without_tooltip',
	hovered_graphical_set = style.confirm_button.default_graphical_set,
	clicked_graphical_set = style.confirm_button.default_graphical_set
}

style.red_back_button_unhoverable = {
	type = 'button_style',
	parent = 'red_back_button',
	hovered_graphical_set = style.red_back_button.default_graphical_set,
	clicked_graphical_set = style.red_back_button.default_graphical_set
}