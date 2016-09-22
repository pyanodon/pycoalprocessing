--luacheck: ignore
PYC = {}
PYC.TAILINGS_POND = {}


--Messages and stuff for developers
PYC.DEBUG = true

--Changes some vanilla/mod recipes to use Creosate
--USE_CREOSOTE_RECIPES, if false will disable use of creosote in vanilla recipes. if true
--then any recipes that are true in USE_CREOSOTE_IN will use creosote.
PYC.USE_CREOSOTE_RECIPES = true
PYC.USE_CREOSOTE_IN = {
  --Rail tracks
  rail = true,
  --Medium power pole, big wooden power pole
  power_poles = true,
}

--Tank size, how much of a fluid the tank can hold
PYC.TAILINGS_POND.TANK_SIZE = 5000

--Does gas entering the tailings pond cause pollution when vented
--default=.15 off=0
PYC.TAILINGS_POND.GAS_POLLUTE_MODIFIER = .15

--Tailings ponds that contain non water liquids pollute the ground they are on
--Disabled for now until it can be refined some more
PYC.TAILINGS_POND.SCORCH = true
PYC.TAILINGS_POND.SCORCH_TICKS = 30 --default: 360?
