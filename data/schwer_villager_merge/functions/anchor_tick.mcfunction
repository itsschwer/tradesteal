execute unless block ~ ~ ~ minecraft:crying_obsidian run function schwer_villager_merge:anchor_broken

particle minecraft:enchant ~ ~2 ~ .1 .1 .1 1 1


# Tag closest villager within set distance as `sts_primary`
execute as @e[type=villager] run tag @s remove sts_primary
execute as @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=!sts_primary] run tag @s add sts_primary

# Tag second closest villager within set distance as `sts_secondary`
execute as @e[type=villager] run tag @s remove sts_secondary
execute as @e[limit=1,sort=nearest,distance=..5,type=villager,tag=!sts_primary,tag=!sts_secondary] run tag @s add sts_secondary

# Summon particles around tagged villagers for visualisation
execute at @e[type=villager,tag=sts_primary,limit=1,sort=nearest,distance=0.5..1] run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.025 1 normal
execute at @e[type=villager,tag=sts_secondary,limit=1,sort=nearest,distance=..5] run particle minecraft:soul ~ ~1 ~ 0 0 0 0.025 1 normal


# Operate check (valid structure, non-empty blast furnace input slots, non-zero offers)
execute if block ~ ~ ~ minecraft:crying_obsidian if block ~-1 ~ ~ minecraft:blast_furnace{CustomName: '{"text":"Take [1-10]"}'} if data block ~-1 ~ ~ Items[0].Count if block ~1 ~ ~ minecraft:blast_furnace{CustomName: '{"text":"Replace [1-8]"}'} if data block ~1 ~ ~ Items[0].Count if data entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_primary] ActiveEffects if data entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_primary] Offers if data entity @e[limit=1,sort=nearest,distance=..5,type=villager,tag=sts_secondary] Offers run function schwer_villager_merge:operate
