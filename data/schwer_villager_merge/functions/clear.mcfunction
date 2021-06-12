schedule clear schwer_villager_merge:tick
function schwer_villager_merge:clean
scoreboard objectives remove svm_score
kill @e[type=area_effect_cloud,tag=svm_anchor]
execute as @e[type=villager] run tag @s remove svm_primary
execute as @e[type=villager] run tag @s remove svm_secondary
