local machines = {}

for _, mach in pairs(data.raw['assembling-machine']) do
    if mach.icon ~= nil then
        if string.match(mach.icon, '__py') then
            table.insert(machines, mach.name)
        end
    end
end

for _, mach in pairs(data.raw.furnace) do
if mach.icon ~= nil then
    if string.match(mach.icon, '__py') ~= nil then
        table.insert(machines, mach.name)
    end
end
end

for _, mach in pairs(machines) do
    if settings.startup['module-slot-change'].value == 'default' then
        break
    elseif settings.startup['module-slot-change'].value == 'plus-one-per' then
        if string.match(mach, '-mk') == nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                if data.raw['assembling-machine'][mach].module_specification ~= nil then
                    data.raw['assembling-machine'][mach].module_specification.module_slots = 1
                end
            elseif data.raw.furnace[mach] ~= nil then
                if data.raw.furnace[mach].module_specification ~= nil then
                    data.raw.furnace[mach].module_specification.module_slots = 1
                end
            end
        end

        if string.match(mach, 'mk01') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 1
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 1
            end
        end

        if string.match(mach, 'mk02') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 2
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 2
            end
        end

        if string.match(mach, 'mk03') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 3
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 3
            end
        end

        if string.match(mach, 'mk04') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 4
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 4
            end
        end
    elseif settings.startup['module-slot-change'].value == 'plus-two-per' then
        if string.match(mach, 'mk01') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 2
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 2
            end
        end

        if string.match(mach, 'mk02') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 4
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 4
            end
        end

        if string.match(mach, 'mk03') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 6
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 6
            end
        end

        if string.match(mach, 'mk04') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 8
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 8
            end
        end
    elseif settings.startup['module-slot-change'].value == 'double-each-tier' then
        if string.match(mach, 'mk01') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 1
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 1
            end
        end

        if string.match(mach, 'mk02') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 2
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 2
            end
        end

        if string.match(mach, 'mk03') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 4
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 4
            end
        end

        if string.match(mach, 'mk04') ~= nil then
            if data.raw['assembling-machine'][mach] ~= nil then
                data.raw['assembling-machine'][mach].module_specification.module_slots = 8
            elseif data.raw.furnace[mach] ~= nil then
                data.raw.furnace[mach].module_specification.module_slots = 8
            end
        end
    end
end
