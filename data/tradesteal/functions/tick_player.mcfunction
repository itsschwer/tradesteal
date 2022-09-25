# Tag closest villager within set distance as `sts_recipient`
execute as @e[limit=1,sort=nearest,distance=..5,type=villager,tag=!sts_recipient] run tag @s add sts_recipient
# Tag next closest villager within set distance as `sts_donor`
execute as @e[limit=1,sort=nearest,distance=..5,type=villager,tag=!sts_recipient,tag=!sts_donor] run tag @s add sts_donor


# Operate check
execute if entity @s[advancements={tradesteal:_trade=true}] if data entity @e[limit=1,sort=nearest,distance=..5,type=villager,tag=sts_recipient] Offers if data entity @e[limit=1,sort=nearest,distance=..5,type=villager,tag=sts_donor] Offers run function tradesteal:operate

advancement revoke @s only tradesteal:_trade
