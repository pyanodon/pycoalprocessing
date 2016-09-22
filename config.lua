--luacheck: ignore

USECREOSOTE_RAIL = true
USECREOSOTE_POLE = true

PYC = {}

--Config settings for tailings ponds
TAILINGS_POND = {}

--Tank size, how much of a fluid the tank can hold
TAILINGS_POND.TANK_SIZE = 5000

--Does gas entering the tailings pond cause pollution when vented
--default=.15 off=0
TAILINGS_POND.GAS_POLLUTE_MODIFIER = .15

--Destroying a tailings pond with non water liquids will change the terrain
--Disabled for now until it can be refined some more
TAILINGS_POND.SCORCH = false

--Messages and stuff for developers
PYC.DEBUG = true
