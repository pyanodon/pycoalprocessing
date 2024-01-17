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

return PYC
