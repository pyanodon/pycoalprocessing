-- Holds circuit connection definitions for PyAL entities.
-- variation counts from 0 (Python-like).

borax_mine_connector_definitions = circuit_connector_definitions.create
(
  universal_connector_template,
  {--Directions are up, right, down, left.
    { variation = 26, main_offset = util.by_pixel(-40, 85), shadow_offset = util.by_pixel(-46, 97), show_shadow = false }, 
    { variation = 26, main_offset = util.by_pixel(-40, 85), shadow_offset = util.by_pixel(-46, 97), show_shadow = false },
    { variation = 26, main_offset = util.by_pixel(-40, 85), shadow_offset = util.by_pixel(-46, 97), show_shadow = false },
    { variation = 26, main_offset = util.by_pixel(-40, 85), shadow_offset = util.by_pixel(-46, 97), show_shadow = false }
  }
)