execute unless block ~ ~ ~ minecraft:crying_obsidian run function schwer_villager_merge:anchor_broken

particle minecraft:enchant ~ ~2 ~ .1 .1 .1 1 1

# Tag closest villager within set distance
execute as @e[type=villager] run tag @s remove svm_primary
execute as @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=!svm_primary] run tag @s add svm_primary

execute at @e[type=villager,tag=svm_primary] run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.05 1 normal
