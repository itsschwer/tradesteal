tellraw @a[distance=..5] ["",{"text":"["},{"text":"Tradesteal","color":"#C77AFF"},{"text":"] "},{"text":"","color":"green"},{"text":"Offering","color":"yellow","italic":true},{"text":" detected, validating structure…","color":"green"}]


# Validation fail checks
execute if entity @e[type=minecraft:area_effect_cloud,tag=sts_anchor,distance=..1] run data merge entity @s {Tags:["sts_rejected"]}
execute unless block ~ ~-1 ~ minecraft:crying_obsidian run data merge entity @s {Tags:["sts_rejected"]}
execute unless block ~-1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Steal"}'} run data merge entity @s {Tags:["sts_rejected"]}
execute unless block ~1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Replace"}'} run data merge entity @s {Tags:["sts_rejected"]}

# Validation fail feedback
execute if entity @e[type=minecraft:area_effect_cloud,tag=sts_anchor,distance=..1] run tellraw @a[distance=..5] ["",{"text":" - A nearby anchor already exists","color":"red"}]
execute unless block ~ ~-1 ~ minecraft:crying_obsidian run tellraw @a[distance=..5] ["",{"text":" - Expected a block of ","color":"red"},{"text":"Crying Obsidian"},{"text":" beneath ","color":"red"},{"text":"Offering","color":"yellow","italic":true},{"text":"","color":"red"}]
execute unless block ~-1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Steal"}'} run tellraw @a[distance=..5] ["",{"text":" - Expected a ","color":"red"},{"text":"Blast Furnace"},{"text":" named ","color":"red"},{"text":"Steal","italic":true},{"text":" to the west of a block of ","color":"red"},{"text":"Crying Obsidian"},{"text":"","color":"red"}]
execute unless block ~1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Replace"}'} run tellraw @a[distance=..5] ["",{"text":" - Expected a ","color":"red"},{"text":"Blast Furnace"},{"text":" named ","color":"red"},{"text":"Replace","italic":true},{"text":" to the east of a block of ","color":"red"},{"text":"Crying Obsidian"},{"text":"","color":"red"}]

# Validation fail
execute as @s[tag=sts_rejected] run tellraw @a[distance=..5] ["",{"text":"["},{"text":"Tradesteal","color":"#C77AFF"},{"text":"] "},{"text":"Offering","color":"yellow","italic":true},{"text":" rejected","color":"red"}]


# Validation success
execute unless entity @e[type=minecraft:area_effect_cloud,tag=sts_anchor,distance=..1] run execute if block ~ ~-1 ~ minecraft:crying_obsidian run execute if block ~-1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Steal"}'} run execute if block ~1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Replace"}'} run function tradesteal:setup_structure
