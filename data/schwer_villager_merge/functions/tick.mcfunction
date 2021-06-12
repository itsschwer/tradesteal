schedule function schwer_villager_merge:tick 1

function schwer_villager_merge:offering_check
execute as @e[tag=svm_anchor] at @s run function schwer_villager_merge:anchor_tick
