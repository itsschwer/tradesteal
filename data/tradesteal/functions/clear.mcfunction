schedule clear tradesteal:tick
function tradesteal:clean
scoreboard objectives remove sts_score
kill @e[type=area_effect_cloud,tag=sts_anchor]
execute as @e[type=villager] run tag @s remove sts_recipient
execute as @e[type=villager] run tag @s remove sts_donor
