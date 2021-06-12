execute unless block ~ ~ ~ minecraft:crying_obsidian run function schwer_villager_merge:anchor_broken

particle minecraft:enchant ~ ~2 ~ .1 .1 .1 1 1


# Tag closest villager within set distance as `svm_primary`
execute as @e[type=villager] run tag @s remove svm_primary
execute as @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=!svm_primary] run tag @s add svm_primary

# Tag second closest villager within set distance as `svm_secondary`
execute as @e[type=villager] run tag @s remove svm_secondary
execute as @e[limit=1,sort=nearest,distance=..5,type=villager,tag=!svm_primary,tag=!svm_secondary] run tag @s add svm_secondary

# Summon particles around tagged villagers for visualisation
execute at @e[type=villager,tag=svm_primary,limit=1,sort=nearest,distance=0.5..1] run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.025 1 normal
execute at @e[type=villager,tag=svm_secondary,limit=1,sort=nearest,distance=..5] run particle minecraft:soul ~ ~1 ~ 0 0 0 0.025 1 normal
