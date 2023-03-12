# Extract desired steal offer --------------------------------------------------

# Copy donor villager offers into storage array for working
data modify storage schwer:tradesteal WorkingArray set from entity @e[type=villager,limit=1,sort=nearest,distance=..5,tag=tradesteal_donor] Offers.Recipes

# Cycle desired steal offer to slot 0
execute store result score arrayLength tradesteal run data get storage schwer:tradesteal WorkingArray
# 'Steal' is held in offhand (refer to `valid_player` predicate)
execute store result score targetIndex tradesteal run data get entity @s Inventory[{Slot:-106b}].Count
scoreboard players set currentIndex tradesteal 1
function tradesteal:cycle_array/forward_check

# Copy desired steal offer from slot 0 to storage
data modify storage schwer:tradesteal OfferCopy set from storage schwer:tradesteal WorkingArray[0]

# Insert desired steal offer ---------------------------------------------------

# Copy recipient villager offers into storage array for working
data modify storage schwer:tradesteal WorkingArray set from entity @e[type=villager,limit=1,sort=nearest,distance=..5,tag=tradesteal_recipient] Offers.Recipes

# Cycle desired replace offer to slot 0
execute store result score arrayLength tradesteal run data get storage schwer:tradesteal WorkingArray
# 'Replace' is held in mainhand (refer to `valid_player` predicate)
execute store result score targetIndex tradesteal run data get entity @s SelectedItem.Count
scoreboard players set currentIndex tradesteal 1
function tradesteal:cycle_array/forward_check

# Copy take offer to replace offer
data modify storage schwer:tradesteal WorkingArray[0] set from storage schwer:tradesteal OfferCopy

# Counter-cycle `WorkingArray` to return to desired offer ordering
scoreboard players set targetIndex tradesteal 1
function tradesteal:cycle_array/backward_check

# Apply changes ----------------------------------------------------------------

# Merge finished modification with recipient villager
data modify entity @e[type=villager,limit=1,sort=nearest,distance=..5,tag=tradesteal_recipient] Offers.Recipes set from storage schwer:tradesteal WorkingArray

# Set the recipient villager's level to 6 to prevent unlocking new trades
data modify entity @e[type=villager,limit=1,sort=nearest,distance=..5,tag=tradesteal_recipient] VillagerData.level set value 6

# Kill donor villager and play effects -----------------------------------------
execute at @e[type=villager,limit=1,sort=nearest,distance=..5,tag=tradesteal_donor] run particle minecraft:soul ~ ~1 ~ 0 0 0 0.1 100 normal
particle minecraft:end_rod ~ ~2 ~ 0 0 0 0.25 100 normal

kill @e[type=villager,limit=1,sort=nearest,distance=..5,tag=tradesteal_donor]

playsound minecraft:block.respawn_anchor.deplete master @a ~ ~ ~
playsound minecraft:block.conduit.deactivate master @a ~ ~ ~

# Grant advancement ------------------------------------------------------------
advancement grant @s only tradesteal:execute

# Clean storage and scoreboard -------------------------------------------------
function tradesteal:clean
