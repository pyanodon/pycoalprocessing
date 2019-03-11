local DEBUG = require("config").DEBUG
if DEBUG then
    local developer = require("__stdlib__/stdlib/data/developer/developer")
    developer.make_test_entities("pycoalprocessing")
end
