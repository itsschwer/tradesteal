# data get block 196 99 -200 Items[0].Count
# data modify entity ca8ba902-27b7-4603-8d81-9da467e738c0 Offers.Recipes[0] merge from entity 743d2a2c-daab-4aa9-81df-b5085f957b31 Offers.Recipes[2]

# execute if block ~-1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Take [1-10]"}'} store result storage schwer:svm_store TakeCount byte 1.0 run data get block ~-1 ~-1 ~ Items[0].Count
# execute unless block ~-1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Take [1-10]"}'} run say 'Take [1-10]' not found

# execute if block ~1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Replace [1-8]"}'} store result storage schwer:svm_store ReplaceCount byte 1.0 run data get block ~1 ~-1 ~ Items[0].Count
# execute unless block ~1 ~-1 ~ minecraft:blast_furnace{CustomName: '{"text":"Replace [1-8]"}'} run say 'Replace [1-8]' not found


# Extract desired take offer
# Copy secondary villager offers into storage array for working
data modify storage schwer:svm_store WorkingArray set from entity @e[limit=1,sort=nearest,distance=..5,type=villager,tag=svm_secondary] Offers.Recipes

# Cycle desired take offer to slot 0
execute store result score arrayLength svm_score run data get storage schwer:svm_store WorkingArray
execute store result score targetIndex svm_score run data get block ~-1 ~ ~ Items[0].Count
scoreboard players set currentIndex svm_score 1
function schwer_villager_merge:cycle_array_loop

# Copy desired take offer from slot 0 to storage
data modify storage schwer:svm_store OfferCopy set from storage schwer:svm_store WorkingArray[0]


# Insert desired take offer
# Copy primary villager offers into storage array for working
data modify storage schwer:svm_store WorkingArray set from entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=svm_primary] Offers.Recipes

# Cycle desired replace offer to slot 0
execute store result score arrayLength svm_score run data get storage schwer:svm_store WorkingArray
execute store result score targetIndex svm_score run data get block ~1 ~ ~ Items[0].Count
scoreboard players set currentIndex svm_score 1
function schwer_villager_merge:cycle_array_loop

# Copy take offer to replace offer
data modify storage schwer:svm_store WorkingArray[0] set from storage schwer:svm_store OfferCopy

# Counter-cycle `WorkingArray` to return to desired offer ordering
scoreboard players set targetIndex svm_score 1
function schwer_villager_merge:counter_cycle_array_loop

# Merge finished modification with primary villager
data modify entity @e[limit=1,sort=nearest,distance=0.5..1,type=villager,tag=svm_primary] Offers.Recipes set from storage schwer:svm_store WorkingArray


function schwer_villager_merge:clean
