-- for all of those internal entities that dont really fit anywhere else

data:extend{
  {
    type = "proxy-container",
    name = "py-dynamic-inserter-target",
    icon = util.empty_icon().icon,
    draw_inventory_content = false,
    collision_mask = {layers = {}},
    selection_box = {{-0.3, -0.3}, {0.3, 0.3}},
    flags = {
      "not-rotatable",
      "placeable-neutral",
      "placeable-off-grid",
      "not-repairable",
      "not-on-map",
      "not-deconstructable",
      "not-blueprintable",
      "hide-alt-info",
      "not-upgradable"
    },
    allow_copy_paste = false,
    selectable_in_game = false,
    hidden = true,
    hidden_in_factoriopedia = true
  }
}