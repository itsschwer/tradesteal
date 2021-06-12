schedule function schwer_villager_merge:tick 1

execute as @e[type=item,limit=1,tag=!sts_rejected,nbt={OnGround: 1b},nbt={Item: {id: "minecraft:nether_star", Count: 1b, tag: {display: {Name: '{"text":"Offering"}'}}}}] at @s run function schwer_villager_merge:validate_structure

execute as @e[tag=sts_anchor] at @s run function schwer_villager_merge:anchor_tick
