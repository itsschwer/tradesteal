schedule function tradesteal:tick 1

# Remove tags (refresh); villagers must be retagged before tick end in order for `_trade` advancement to function
execute as @e[type=villager,tag=tradesteal_recipient] run tag @s remove tradesteal_recipient
execute as @e[type=villager,tag=tradesteal_donor] run tag @s remove tradesteal_donor

execute as @a[predicate=tradesteal:valid_player] at @s run function tradesteal:tick_player

# Summon particles around tagged villagers for visualisation
execute at @e[type=villager,tag=tradesteal_recipient] run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.025 1 normal
execute at @e[type=villager,tag=tradesteal_donor] run particle minecraft:soul ~ ~1 ~ 0 0 0 0.025 1 normal
