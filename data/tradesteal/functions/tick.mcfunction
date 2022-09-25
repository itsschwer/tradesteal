schedule function tradesteal:tick 1

# Remove tags (refresh)
execute as @e[type=villager,tag=sts_recipient] run tag @s remove sts_recipient
execute as @e[type=villager,tag=sts_donor] run tag @s remove sts_donor

execute as @a[predicate=tradesteal:valid_player] at @s run function tradesteal:tick_player

# Summon particles around tagged villagers for visualisation
execute at @e[type=villager,tag=sts_recipient] run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.025 1 normal
execute at @e[type=villager,tag=sts_donor] run particle minecraft:soul ~ ~1 ~ 0 0 0 0.025 1 normal
