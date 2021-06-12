tellraw @a[distance=..5] ["",{"text":"["},{"text":"itsschwer","color":"#C77AFF"},{"text":"] "},{"text":"","color":"green"},{"text":"Offering","color":"yellow"},{"text":" detected, validating structure…","color":"green"}]


# Validation fail checks
execute if entity @e[type=minecraft:area_effect_cloud,tag=svm_anchor,distance=..1] run data merge entity @s {Tags:["svm_rejected"]}
execute unless block ~ ~-1 ~ minecraft:crying_obsidian run data merge entity @s {Tags:["svm_rejected"]}
execute unless block ~-1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Take [1-10]"}'} run data merge entity @s {Tags:["svm_rejected"]}
execute unless block ~1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Replace [1-8]"}'} run data merge entity @s {Tags:["svm_rejected"]}

# Validation fail feedback
execute if entity @e[type=minecraft:area_effect_cloud,tag=svm_anchor,distance=..1] run tellraw @a[distance=..5] ["",{"text":"["},{"text":"itsschwer","color":"#C77AFF"},{"text":"] "},{"text":"A nearby structure already exists","color":"green"}]
execute unless block ~ ~-1 ~ minecraft:crying_obsidian run tellraw @a[distance=..5] ["",{"text":"["},{"text":"itsschwer","color":"#C77AFF"},{"text":"] "},{"text":"Expected a block of ","color":"green"},{"text":"Crying Obsidian"},{"text":" beneath ","color":"green"},{"text":"Offering","color":"yellow"},{"text":"","color":"green"}]
execute unless block ~-1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Take [1-10]"}'} run tellraw @a[distance=..5] ["",{"text":"["},{"text":"itsschwer","color":"#C77AFF"},{"text":"] "},{"text":"Expected a ","color":"green"},{"text":"Blast Furnace"},{"text":" named '","color":"green"},{"text":"Take [1-10]"},{"text":"' to the west of a block of ","color":"green"},{"text":"Crying Obsidian"},{"text":"","color":"green"}]
execute unless block ~1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Replace [1-8]"}'} run tellraw @a[distance=..5] ["",{"text":"["},{"text":"itsschwer","color":"#C77AFF"},{"text":"] "},{"text":"Expected a ","color":"green"},{"text":"Blast Furnace"},{"text":" named '","color":"green"},{"text":"Replace [1-8]"},{"text":"' to the east of a block of ","color":"green"},{"text":"Crying Obsidian"},{"text":"","color":"green"}]

# Validation fail
execute as @s[tag=svm_rejected] run tellraw @a[distance=..5] ["",{"text":"["},{"text":"itsschwer","color":"#C77AFF"},{"text":"] "},{"text":"Offering","color":"yellow"},{"text":" rejected","color":"green"}]


# Validation success
execute unless entity @e[type=minecraft:area_effect_cloud,tag=svm_anchor,distance=..1] run execute if block ~ ~-1 ~ minecraft:crying_obsidian run execute if block ~-1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Take [1-10]"}'} run execute if block ~1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Replace [1-8]"}'} run function schwer_villager_merge:setup_structure
