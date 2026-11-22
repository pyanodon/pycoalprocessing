-- factory planner integration

remote.add_interface("fp-integration-pycoalprocessing", {
    compacting_recipes = (function()
        local compacting_recipes = {}
        for _, proto in pairs(prototypes.recipe) do
            for _, pattern in pairs({"^fill%-.*%-canister$", "^empty%-.*%-canister$"}) do
                if string.match(proto.name, pattern) then
                    compacting_recipes[#compacting_recipes+1] = proto.name
                    break
                end
            end
        end
        return {version = 1, recipes = compacting_recipes}
    end)
})