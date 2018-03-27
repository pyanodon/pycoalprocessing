local DEBUG = require("config").DEBUG
if DEBUG then
    local developer = require('stdlib/data/developer/developer')
    developer.make_test_entities('pycoalprocessing')
end
