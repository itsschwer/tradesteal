# Debug call while `operate` is yet to be hooked up:
# execute as @e[type=minecraft:area_effect_cloud] at @s run function tradesteal:operate

# Extract desired steal offer
# Copy donor villager offers into storage array for working
data modify storage schwer:sts_store WorkingArray set from entity @e[limit=1,sort=nearest,distance=..5,type=villager,tag=sts_donor] Offers.Recipes

# Cycle desired steal offer to slot 0
execute store result score arrayLength sts_score run data get storage schwer:sts_store WorkingArray
execute store result score targetIndex sts_score run data get block ~-1 ~ ~ Items[0].Count
scoreboard players set currentIndex sts_score 1
function tradesteal:cycle_array_loop

# Copy desired steal offer from slot 0 to storage
data modify storage schwer:sts_store OfferCopy set from storage schwer:sts_store WorkingArray[0]


# Insert desired steal offer
# Copy recipient villager offers into storage array for working
data modify storage schwer:sts_store WorkingArray set from entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_recipient] Offers.Recipes

# Cycle desired replace offer to slot 0
execute store result score arrayLength sts_score run data get storage schwer:sts_store WorkingArray
execute store result score targetIndex sts_score run data get block ~1 ~ ~ Items[0].Count
scoreboard players set currentIndex sts_score 1
function tradesteal:cycle_array_loop

# Copy take offer to replace offer
data modify storage schwer:sts_store WorkingArray[0] set from storage schwer:sts_store OfferCopy

# Counter-cycle `WorkingArray` to return to desired offer ordering
scoreboard players set targetIndex sts_score 1
function tradesteal:counter_cycle_array_loop

# Merge finished modification with recipient villager
data modify entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_recipient] Offers.Recipes set from storage schwer:sts_store WorkingArray


# Set the recipient villager's level to 6 to prevent unlocking new trades
data modify entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_recipient] VillagerData.level set value 6

# Remove the recipient villager's active effects (since this is used to trigger a trade steal)
effect clear @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=sts_recipient]

# Kill donor villager and play effects
execute at @e[limit=1,sort=nearest,distance=..5,type=villager,tag=sts_donor] run particle minecraft:soul ~ ~1 ~ 0 0 0 0.1 100 normal
particle minecraft:end_rod ~ ~2 ~ 0 0 0 0.25 100 normal

kill @e[limit=1,sort=nearest,distance=..5,type=villager,tag=sts_donor]

playsound minecraft:block.respawn_anchor.deplete master @a ~ ~ ~
playsound minecraft:block.conduit.deactivate master @a ~ ~ ~

# Give advancement to nearby players
advancement grant @a[distance=..5] only tradesteal:operate


function tradesteal:clean
