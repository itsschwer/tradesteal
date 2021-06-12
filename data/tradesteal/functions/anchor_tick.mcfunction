execute unless block ~ ~ ~ minecraft:crying_obsidian run function tradesteal:anchor_broken

particle minecraft:enchant ~ ~2 ~ .1 .1 .1 1 1


# Tag closest villager within set distance as `sts_recipient`
execute as @e[type=villager] run tag @s remove sts_recipient
execute as @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=!sts_recipient] run tag @s add sts_recipient

# Tag second closest villager within set distance as `sts_donor`
execute as @e[type=villager] run tag @s remove sts_donor
execute as @e[limit=1,sort=nearest,distance=..5,type=villager,tag=!sts_recipient,tag=!sts_donor] run tag @s add sts_donor

# Summon particles around tagged villagers for visualisation
execute at @e[type=villager,tag=sts_recipient,limit=1,sort=nearest,distance=0.5..1] run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.025 1 normal
execute at @e[type=villager,tag=sts_donor,limit=1,sort=nearest,distance=..5] run particle minecraft:soul ~ ~1 ~ 0 0 0 0.025 1 normal


# Operate check (valid structure, non-empty blast furnace input slots, non-zero offers)
execute if block ~ ~ ~ minecraft:crying_obsidian if block ~-1 ~ ~ minecraft:blast_furnace{CustomName: '{"text":"Steal"}'} if data block ~-1 ~ ~ Items[0].Count if block ~1 ~ ~ minecraft:blast_furnace{CustomName: '{"text":"Replace"}'} if data block ~1 ~ ~ Items[0].Count if data entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_recipient] ActiveEffects if data entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_recipient] Offers if data entity @e[limit=1,sort=nearest,distance=..5,type=villager,tag=sts_donor] Offers run function tradesteal:operate
