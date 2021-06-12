tellraw @a[distance=..5] ["",{"text":"["},{"text":"itsschwer","color":"#C77AFF"},{"text":"] "},{"text":"Offering","color":"yellow"},{"text":" accepted","color":"green"}]


# Align to block center using item_frame
# https://gaming.stackexchange.com/questions/207273/teleport-entities-relatively-to-the-center-of-a-block
# https://old.reddit.com/r/Minecraft/comments/2n4u5h/center_entity_on_current_block/
# [Customised]
# Needs to use `execute at` to get new position

summon item_frame ~ ~-1 ~ {Tags:["svm_align"]}
tp @s @e[limit=1,type=item_frame,tag=svm_align,distance=..1]
execute at @s run function schwer_villager_merge:setup_structure
kill @e[limit=1,type=item_frame,tag=svm_align,distance=..1]


# Kill offering
kill @s[type=item]