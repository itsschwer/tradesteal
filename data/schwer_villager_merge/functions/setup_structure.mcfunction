particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.1 100 normal
playsound minecraft:block.beacon.power_select master @a[distance=..5] ~ ~ ~

# Offset to block y-center
summon area_effect_cloud ~ ~-0.46875 ~ {Duration:2147000000,Tags:["svm_anchor"],Radius:0.01,Particle:"minecraft:underwater"}
