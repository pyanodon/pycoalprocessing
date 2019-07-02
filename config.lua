local PYC = {} --Do not change
PYC.TAILINGS_POND = {} --Do not change
PYC.control = {} --Do not change

--Messages and stuff for developers
--These should be false in a release.
PYC.DEBUG = false
PYC.control.loglevel = 0

--Changes some vanilla/mod recipes to use Creosate
--USE_CREOSOTE_RECIPES, if false will disable use of creosote in vanilla recipes. if true
--then any recipes that are true in USE_CREOSOTE_IN will use creosote.
PYC.USE_CREOSOTE_RECIPES = true
PYC.USE_CREOSOTE_IN = {
    --Rail tracks
    rail = true,
    --Medium power pole, big wooden power pole
    power_poles = true
}

--Does gas entering the tailings pond cause pollution when vented
--default=.15 off=0
PYC.TAILINGS_POND.GAS_POLLUTE_MODIFIER = .15

--Tailings ponds that contain non clean water liquids pollute the ground they are on
--chance is a percentage from 1 to 100, set to 0 to disable.
--ticks is the number of ticks that must pass with a full tank before another check is done.
PYC.TAILINGS_POND.SCORCH_CHANCE = 3--3 --default 3
PYC.TAILINGS_POND.SCORCH_TICKS = 36000--36000 --default: 36000 (this will check every 10 minutes)

--List of Gas fluids, true values cause pollution when vented, all gasses with gas in the name fall under this category
PYC.TAILINGS_POND.GAS = {
    ["chlorine"] = true,
    ["hydrogen-chloride"] = true,
    ["sulfur-dioxide"] = true,
    ["oxygen"] = false,
    ["hydrogen"] = false,
    ["carbon-dioxide"] = false,
    ["nitrogen"] = false,
    ["nitrogen-dioxide"] = false,
    ["wind"] = false
}

return PYC
