# Move last item to front
data modify storage schwer:sts_store WorkingArray prepend from storage schwer:sts_store WorkingArray[-1]
data remove storage schwer:sts_store WorkingArray[-1]
scoreboard players remove currentIndex sts_score 1
function tradesteal:counter_cycle_array_loop
