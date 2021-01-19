
--modify steam engine temp
data.raw.generator['steam-engine'].maximum_temperature = 500

--modify steam turbine temp
data.raw.generator['steam-turbine'].maximum_temperature = 2000

data.raw.boiler.boiler.target_temperature = 250

--modify assembly machine 1
data.raw['assembling-machine']['assembling-machine-1'].ingredient_count = 2
data.raw['assembling-machine']['assembling-machine-1'].energy_usage = "200KW"
data.raw['assembling-machine']['assembling-machine-1'].crafting_speed = 1

--modify assembly machine 2
data.raw['assembling-machine']['assembling-machine-2'].ingredient_count = 4
data.raw['assembling-machine']['assembling-machine-2'].energy_usage = "500KW"
data.raw['assembling-machine']['assembling-machine-2'].crafting_speed = 2

--modify assembly machine 3
--data.raw['assembling-machine']['assembling-machine-3'].ingredient_count = 4
data.raw['assembling-machine']['assembling-machine-3'].energy_usage = "1MW"
data.raw['assembling-machine']['assembling-machine-3'].crafting_speed = 3

--modify mining drill power and speed
data.raw['mining-drill']['burner-mining-drill'].mining_speed = 1
data.raw['mining-drill']['burner-mining-drill'].energy_usage = '500KW'

data.raw['mining-drill']['electric-mining-drill'].mining_speed = 2
data.raw['mining-drill']['electric-mining-drill'].energy_usage = '1MW'
