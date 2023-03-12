# Tag closest villager within set distance as `tradesteal_recipient`
execute as @e[type=villager,limit=1,sort=nearest,distance=..5,tag=!tradesteal_recipient] run tag @s add tradesteal_recipient
# Tag next closest villager within set distance as `tradesteal_donor`
execute as @e[type=villager,limit=1,sort=nearest,distance=..5,tag=!tradesteal_recipient,tag=!tradesteal_donor] run tag @s add tradesteal_donor

# Execute check
execute if entity @s[advancements={tradesteal:_trade=true}] if data entity @e[type=villager,limit=1,sort=nearest,distance=..5,tag=tradesteal_recipient] Offers if data entity @e[limit=1,sort=nearest,distance=..5,type=villager,tag=tradesteal_donor] Offers run function tradesteal:execute
advancement revoke @s only tradesteal:_trade
