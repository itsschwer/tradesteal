tellraw @a[distance=..5] ["",{"text":"["},{"text":"itsschwer","color":"#C77AFF"},{"text":"] "},{"text":"Offering","color":"yellow"},{"text":" accepted","color":"green"}]

# Align to block center using item_frame
# https://gaming.stackexchange.com/questions/207273/teleport-entities-relatively-to-the-center-of-a-block
# https://old.reddit.com/r/Minecraft/comments/2n4u5h/center_entity_on_current_block/
# Seems like `execute at @s run` is needed to get the new position!
summon item_frame ~ ~-1 ~ {Tags:["svm_align"]}
tp @s @e[limit=1,type=item_frame,tag=svm_align,distance=..1]
execute at @s run kill @e[limit=1,type=item_frame,tag=svm_align,distance=0]

# Play effects
execute at @s run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.1 100 normal
execute at @s run playsound minecraft:block.beacon.power_select master @a ~ ~ ~

# Summon anchor; offset to block y-center
execute at @s run summon area_effect_cloud ~ ~-0.46875 ~ {Duration:2147000000,Tags:["svm_anchor"],Radius:0.01,Particle:"minecraft:underwater"}


# Kill offering
kill @s[type=item]
