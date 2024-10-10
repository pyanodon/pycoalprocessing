-- Adds circuit connection definitions for PyCP entities to the pre-existing global table
-- for base-game implementation details, see https://github.com/wube/factorio-data/blob/ed3d12197fbbe63fcd19c0eb23bc826cea44410f/core/lualib/circuit-connector-sprites.lua#L101
-- variation counts from 0 (Python-like).

circuit_connector_definitions["borax-mine-mkxx"] = circuit_connector_definitions.create_vector
    (
      universal_connector_template,
      { --Directions are up, right, down, left.
        {variation = 26, main_offset = util.by_pixel(-40, 85), shadow_offset = util.by_pixel(-46, 97), show_shadow = false},
        {variation = 26, main_offset = util.by_pixel(-40, 85), shadow_offset = util.by_pixel(-46, 97), show_shadow = false},
        {variation = 26, main_offset = util.by_pixel(-40, 85), shadow_offset = util.by_pixel(-46, 97), show_shadow = false},
        {variation = 26, main_offset = util.by_pixel(-40, 85), shadow_offset = util.by_pixel(-46, 97), show_shadow = false}
      }
    )

circuit_connector_definitions["niobium-mine"] = circuit_connector_definitions.create_vector
    (
      universal_connector_template,
      { --Directions are up, right, down, left.
        {variation = 18, main_offset = util.by_pixel(-84, -5), shadow_offset = util.by_pixel(-78, 7), show_shadow = false},
        {variation = 18, main_offset = util.by_pixel(-84, -5), shadow_offset = util.by_pixel(-78, 7), show_shadow = false},
        {variation = 18, main_offset = util.by_pixel(-84, -5), shadow_offset = util.by_pixel(-78, 7), show_shadow = false},
        {variation = 18, main_offset = util.by_pixel(-84, -5), shadow_offset = util.by_pixel(-78, 7), show_shadow = false}
      }
    )
