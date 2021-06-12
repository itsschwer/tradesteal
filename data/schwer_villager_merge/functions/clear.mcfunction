schedule clear schwer_villager_merge:tick
function schwer_villager_merge:clean
scoreboard objectives remove sts_score
kill @e[type=area_effect_cloud,tag=sts_anchor]
execute as @e[type=villager] run tag @s remove sts_primary
execute as @e[type=villager] run tag @s remove sts_secondary
