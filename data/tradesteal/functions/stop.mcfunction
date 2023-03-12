schedule clear tradesteal:tick
function tradesteal:clean
scoreboard objectives remove tradesteal

execute as @e[type=villager,tag=tradesteal_recipient] run tag @s remove tradesteal_recipient
execute as @e[type=villager,tag=tradesteal_donor] run tag @s remove tradesteal_donor
