kill @s[type=area_effect_cloud]

tellraw @a[distance=..5] ["",{"text":"["},{"text":"Tradesteal","color":"#C77AFF"},{"text":"] "},{"text":"Anchor broken","color":"green"}]

playsound minecraft:block.beacon.deactivate master @a ~ ~ ~
particle minecraft:end_rod ~ ~ ~ 0 0 0 0.05 50 normal
