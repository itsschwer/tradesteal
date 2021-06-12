# Move first item to end (by copying to end then removing first)
# Reference: https://www.youtube.com/watch?v=Bt6xD8vE7Pw
data modify storage schwer:sts_store WorkingArray append from storage schwer:sts_store WorkingArray[0]
data remove storage schwer:sts_store WorkingArray[0]
scoreboard players add currentIndex sts_score 1
function schwer_villager_merge:cycle_array_loop
