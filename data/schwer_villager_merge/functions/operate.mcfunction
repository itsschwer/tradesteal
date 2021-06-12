# Debug call while `operate` is yet to be hooked up:
# execute as @e[type=minecraft:area_effect_cloud] at @s run function schwer_villager_merge:operate

# Extract desired take offer
# Copy secondary villager offers into storage array for working
data modify storage schwer:sts_store WorkingArray set from entity @e[limit=1,sort=nearest,distance=..5,type=villager,tag=sts_secondary] Offers.Recipes

# Cycle desired take offer to slot 0
execute store result score arrayLength sts_score run data get storage schwer:sts_store WorkingArray
execute store result score targetIndex sts_score run data get block ~-1 ~ ~ Items[0].Count
scoreboard players set currentIndex sts_score 1
function schwer_villager_merge:cycle_array_loop

# Copy desired take offer from slot 0 to storage
data modify storage schwer:sts_store OfferCopy set from storage schwer:sts_store WorkingArray[0]


# Insert desired take offer
# Copy primary villager offers into storage array for working
data modify storage schwer:sts_store WorkingArray set from entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_primary] Offers.Recipes

# Cycle desired replace offer to slot 0
execute store result score arrayLength sts_score run data get storage schwer:sts_store WorkingArray
execute store result score targetIndex sts_score run data get block ~1 ~ ~ Items[0].Count
scoreboard players set currentIndex sts_score 1
function schwer_villager_merge:cycle_array_loop

# Copy take offer to replace offer
data modify storage schwer:sts_store WorkingArray[0] set from storage schwer:sts_store OfferCopy

# Counter-cycle `WorkingArray` to return to desired offer ordering
scoreboard players set targetIndex sts_score 1
function schwer_villager_merge:counter_cycle_array_loop

# Merge finished modification with primary villager
data modify entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_primary] Offers.Recipes set from storage schwer:sts_store WorkingArray


# Set the primary villager's level to 6 to prevent unlocking new trades
data modify entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_primary] VillagerData.level set value 6

# Remove the primary villager's active effects (since this is used to trigger a trade steal)
effect clear @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_primary]

# Kill donor villager and play effects
execute at @e[limit=1,sort=nearest,distance=..5,type=villager,tag=sts_secondary] run particle minecraft:soul ~ ~1 ~ 0 0 0 0.1 100 normal
particle minecraft:end_rod ~ ~2 ~ 0 0 0 0.25 100 normal

kill @e[limit=1,sort=nearest,distance=..5,type=villager,tag=sts_secondary]

playsound minecraft:block.respawn_anchor.deplete master @a ~ ~ ~
playsound minecraft:block.conduit.deactivate master @a ~ ~ ~


function schwer_villager_merge:clean
